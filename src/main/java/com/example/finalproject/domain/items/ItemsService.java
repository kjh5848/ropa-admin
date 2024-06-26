package com.example.finalproject.domain.items;


import com.example.finalproject._core.error.exception.Exception401;
import com.example.finalproject._core.error.exception.Exception404;
import com.example.finalproject._core.error.exception.SSRException401;
import com.example.finalproject._core.error.exception.SSRException404;
import com.example.finalproject.domain.admin.Admin;
import com.example.finalproject.domain.admin.AdminRepository;
import com.example.finalproject.domain.category.Category;
import com.example.finalproject.domain.photo.Photo;
import com.example.finalproject.domain.photo.PhotoRepository;
import com.example.finalproject.domain.photo.PhotoService;
import com.example.finalproject.domain.user.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class ItemsService {
    private final AdminRepository adminRepository;
    private final ItemsRepository itemsRepository;
    private final UserRepository userRepository;
    private final PhotoService photoService;
    private final PhotoRepository photoRepository;

    // 아이템 수정
    @Transactional
    public void updateItem(Integer itemId, ItemsRequest.UpdateDTO reqDTO, Integer sessionBrandId) {
        // Admin 정보 조회
        Admin admin = adminRepository.findById(sessionBrandId)
                .orElseThrow(() -> new SSRException401("브랜드 관리자의 정보를 찾을 수 없습니다."));

        // 아이템 정보 조회
        Items items = itemsRepository.findById(itemId)
                .orElseThrow(() -> new SSRException404("아이템을 찾을 수 없습니다."));

        List<Photo> itemsPhotos = photoRepository.findAllByItemsId(itemId);

        // 아이템 정보 업데이트
        items.setName(reqDTO.getName());
        items.setDescription(reqDTO.getDescription());
        items.setSize(reqDTO.getSize());
        items.setPrice(reqDTO.getPrice());
        items.setDiscountPrice(reqDTO.getDiscountPrice());
        items.setStock(reqDTO.getStock());
        itemsPhotos.forEach(photo -> {
            if (photo.getIsMainPhoto()) {
                try {
                    photoService.updateMainImage(reqDTO.getMainImage(), photo, items);

                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            } else {
                try {
                    photoService.updateDetailImage(reqDTO.getDetailImage(), photo, items);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        });

        // 카테고리 정보 업데이트
        Category category = items.getCategory();
        category.setMain(reqDTO.getMainCategory());
        category.setSub(reqDTO.getSubCategory());

        // 엔티티 저장
        itemsRepository.save(items);
    }

    //아이템 디테일 페이지 요청
    public ItemsResponse.ItemDetail itemDetail(Integer itemId) {
        Items item = itemsRepository.findItemsByAdminAndPhotos(itemId)
                .orElseThrow(() -> new Exception404("등록된 아이템이 아닙니다."));
        List<Photo> mainPhotos = item.getPhotos().stream()
                .filter(Photo::getIsMainPhoto)  // isMainPhoto가 true인 photo만 필터링
                .collect(Collectors.toList());
        List<Photo> detailPhotos = item.getPhotos().stream()
                .filter(photo -> !photo.getIsMainPhoto())
                .sorted(Comparator.comparing(Photo::getId)).toList();

        return new ItemsResponse.ItemDetail(item, mainPhotos, detailPhotos);
    }

    // 아이템 저장
    @Transactional
    public void saveItem(ItemsRequest.SaveDTO reqDTO, Integer sessionBrandId) {
        // Admin 정보 조회
        Admin admin = adminRepository.findById(sessionBrandId)
                .orElseThrow(() -> new SSRException401("브랜드 관리자의 정보를 찾을 수 없습니다."));
        Items savedItems = itemsRepository.save(reqDTO.toEntity(admin));

        photoService.uploadItemMainImage(reqDTO.getMainImage(), savedItems);
        photoService.uploadItemDetailImage(reqDTO.getDetailImage(), savedItems);
    }

    // 아이템 목록
    public List<ItemsResponse.list> findItemsByAdminId(Integer sessionBrandId, String searchBy, String keyword) {
        // Admin 정보 조회
        Admin admin = adminRepository.findById(sessionBrandId)
                .orElseThrow(() -> new SSRException401("브랜드 관리자의 정보를 찾을 수 없습니다."));

        List<Items> items = switch (searchBy) {
            case "itemId" -> itemsRepository.findItemsByAdminIdAndItemId(admin.getId(), keyword);
            case "itemName" -> itemsRepository.findItemsByAdminIdAndItemName(admin.getId(), keyword);
            case "category" -> itemsRepository.findItemsByAdminIdAndCategory(admin.getId(), keyword);
            case null, default ->  // 기본값은 상품명으로 검색
                    itemsRepository.findItemsByAdminId(admin.getId());
        };

        return items.stream().map(ItemsResponse.list::new).toList();
    }

    // 아이템 상세보기
    public ItemsResponse.Detail findItemsByAdminIdAndItemId(Integer sessionAdminId, Integer itemId) {
        // Admin 정보 조회
        Admin admin = adminRepository.findById(sessionAdminId)
                .orElseThrow(() -> new SSRException401("브랜드 관리자의 정보를 찾을 수 없습니다."));

        // 아이템 정보 조회
        Items items = itemsRepository.findItemsByAdminIdAndItemId(admin.getId(), itemId)
                .orElseThrow(() -> new SSRException404("브랜드 아이템 정보를 찾을 수 없습니다."));

        // 아이템 사진 조회
        List<Photo> itemPhotos = photoRepository.findAllByItemsId(itemId);

        return new ItemsResponse.Detail(items, itemPhotos);
    }


    // 아이템 삭제
    @Transactional
    public void deleteItem(Integer itemId, Admin sessionAdmin) {
        // Admin 정보 조회
        Admin admin = adminRepository.findById(sessionAdmin.getId())
                .orElseThrow(() -> new SSRException401("브랜드 관리자의 정보를 찾을 수 없습니다."));

        // 아이템 정보 조회
        Items items = itemsRepository.findById(itemId)
                .orElseThrow(() -> new SSRException404("아이템을 찾을 수 없습니다."));

        // 아이템 삭제 상태 업데이트
        items.setStatus(false);

        // 엔티티 저장
        itemsRepository.save(items);

        // 아이템에 연결된 사진 삭제
        photoService.deleteByItemId(itemId);
    }

    // 유저 아이템 검색 기능
    public List<ItemsResponse.ItemListDTO> searchItems(String keyword) {
        List<Items> items;

        if (keyword == null || keyword.isEmpty()) {
            items = itemsRepository.findByAllItems();
            return items.stream().map(ItemsResponse.ItemListDTO::new).collect(Collectors.toList());
        }

        items = itemsRepository.findItemsByItemName(keyword);
        return items.stream().map(ItemsResponse.ItemListDTO::new).collect(Collectors.toList());
    }
}

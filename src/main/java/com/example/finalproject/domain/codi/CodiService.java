package com.example.finalproject.domain.codi;

import com.example.finalproject._core.error.exception.Exception401;
import com.example.finalproject.domain.admin.Admin;
import com.example.finalproject.domain.admin.AdminRepository;
import com.example.finalproject.domain.codiItems.CodiItems;
import com.example.finalproject.domain.codiItems.CodiItemsRepository;
import com.example.finalproject.domain.items.Items;
import com.example.finalproject.domain.items.ItemsRepository;
import com.example.finalproject.domain.love.Love;
import com.example.finalproject.domain.love.LoveRepository;
import com.example.finalproject.domain.photo.Photo;
import com.example.finalproject.domain.photo.PhotoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class CodiService {
    private final CodiItemsRepository codiItemsRepository;
    private final PhotoRepository photoRepository;
    private final LoveRepository loveRepository;
    private final ItemsRepository itemsRepository;
    private final AdminRepository adminRepository;

    //코디 등록 페이지 - 아이템 연결
    public List<CodiResponse.BrandInfo> addItemPage() {
        //모든 브랜드 정보 불러오기
        List<Admin> admins = adminRepository.findAdminByPhoto();

        //브랜드 기준으로 본인이 올린 아이템 정보 불러오기
        List<CodiResponse.BrandInfo> respList = admins.stream().map(admin -> {
            List<Items> adminItems = itemsRepository.findByAdminItemsAndPhotos(admin.getId());
            return new CodiResponse.BrandInfo(admin, adminItems);
        }).toList();
        return respList;
    }


    // 코디 보기 페이지 요청 - 페이지 내 아이템 목록, 크리에이터 코디목록 포함
    public CodiResponse.MainViewDTO codiPage(Integer codiId, Integer userId) {

        // codiId로 코디 메인 사진들 조회
        List<Photo> mainCodiPhotos = photoRepository.findByCodiId(codiId);

        // 해당 코디에 대한 사용자의 좋아요 상태 확인 + 해당 코디의 전체 좋아요 갯수
        Optional<Love> loveStatus = loveRepository.findByCodiIdAndUserLoveStatus(codiId, userId);
        Long totalLove = loveRepository.countTotalLove(codiId);

        // codiItems로 조회해서 Codi 정보랑 연계된 Items조회후 사진 가져오기
        List<CodiItems> codiItemsList = codiItemsRepository.findByCodiWithItems(codiId);
        List<Integer> itemsIdList = codiItemsList.stream().map(codiItems -> codiItems.getItems().getId()).toList();
        List<Photo> codiItemPhotos = photoRepository.findByItemsIds(itemsIdList);

        // CreatorId로 모든 코디를 조회해서 여러 코디 메인 사진 가져오기
        Codi selectedCodi = codiItemsList.getFirst().getCodi();
        List<Photo> otherCodiPhotos = photoRepository.findByUserIdWithCodiesAndPhoto(selectedCodi.getUser().getId());

        return new CodiResponse.MainViewDTO(
                selectedCodi, loveStatus, totalLove, mainCodiPhotos, codiItemPhotos, otherCodiPhotos);

    }
}

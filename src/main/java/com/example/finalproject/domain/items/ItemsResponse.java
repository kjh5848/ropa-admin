package com.example.finalproject.domain.items;

import com.example.finalproject.domain.photo.Photo;
import lombok.Data;

import java.util.List;

public class ItemsResponse {
    //크리에이터의 아이템 상세페이지
    @Data
    public static class ItemDetail {
        private Integer itemId;
        private Integer itemPhotoId;
        private String mainPhotoName;
        private String mainPhotoPath;
        private Boolean isMainPhoto;
        private Photo.Sort itemPhoto;
        private String brandName;
        private Integer price;
        private Double discountRate;
        private Integer discountPrice;
        private ItemSubPhoto itemSubPhoto;


        public ItemDetail(Items item, ItemSubPhoto itemSubPhoto) {
            this.itemId = item.getId();
            this.itemPhotoId = item.getPhotos().getFirst().getId();
            this.mainPhotoName = item.getPhotos().getFirst().getName();
            this.mainPhotoPath = item.getPhotos().getFirst().getPath();
            this.isMainPhoto = item.getPhotos().getFirst().getIsMainPhoto();
            this.itemPhoto = item.getPhotos().getFirst().getSort();
            this.brandName = item.getAdmin().getBrandName();
            this.price = item.getPrice();
            this.discountRate = item.getDiscountRate();
            this.discountPrice = item.getDiscountPrice();
            this.itemSubPhoto = itemSubPhoto;


        }

        @Data
        public static class ItemSubPhoto {
            private Integer itemPhotoId;
            private String subPhotoName;
            private String subPhotoPath;
            private Boolean isSubPhoto;
            private Photo.Sort itemPhoto;

            public ItemSubPhoto(Items item) {
                this.itemPhotoId = item.getPhotos().get(1).getId();
                this.subPhotoName = item.getPhotos().get(1).getName();
                this.subPhotoPath = item.getPhotos().get(1).getPath();
                this.isSubPhoto = item.getPhotos().get(1).getIsMainPhoto();
                this.itemPhoto = item.getPhotos().get(1).getSort();
            }
        }
    }

    //브랜드의 상품 목록 보기
    @Data
    public static class list {
        private Integer itemId;
        private String itemName;
        private Integer price;
        private String mainCategory;
        private Integer stock;

        public list(Items items) {
            this.itemId = items.getId();
            this.itemName = items.getName();
            this.price = items.getPrice();
            this.mainCategory = items.getCategory().getMain();
            this.stock = items.getStock();
        }
    }

    // 아이템 상세보기
    @Data
    public static class Detail {
        private Integer itemId;
        private String name;
        private String description;
        private String size;
        private Integer price;
        private Integer discountPrice;
        private Integer stock;
        private String mainCategory;
        private String subCategory;
        private String itemMainImage;
        private String itemDetailImage;

        public Detail(Items items, List<Photo> itemPhotos) {
            this.itemId = items.getId();
            this.name = items.getName();
            this.description = items.getDescription();
            this.size = items.getSize();
            this.price = items.getPrice();
            this.discountPrice = items.getDiscountPrice();
            this.stock = items.getStock();
            this.mainCategory = items.getCategory().getMain();
            this.subCategory = items.getCategory().getSub();
            itemPhotos.forEach(photo -> {
                if (photo.getIsMainPhoto()) {
                    this.itemMainImage = photo.getPath();
                } else {
                    this.itemDetailImage = photo.getPath();
                }
            });
        }
    }
}

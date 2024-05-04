package com.example.finalproject.domain.codi;

import com.example.finalproject.domain.love.Love;
import com.example.finalproject.domain.photo.Photo;
import lombok.Data;

import java.util.List;
import java.util.Optional;

public class CodiResponse {

    @Data
    public static class MainViewDTO {
        private Integer codiId;
        private String description;
        private String createdAt;
        private Boolean isloved;
        private Long loveCount;
        private List<MainPhotoDTO> mainPhotos;
        private List<ItemsPhotoDTO> itemPhotos;
        private List<CodiPhotoDTO> otherCodiPhotos;

        public MainViewDTO(Codi codi, Optional<Love> codiLoveStatus, Long totalLoves, List<Photo> mainPhotos, List<Photo> itemPhotos, List<Photo> otherCodiPhotos) {
            this.codiId = codi.getId();
            this.description = codi.getDescription();
            this.createdAt = codi.getCreatedAt().toString();
            if (codiLoveStatus.isEmpty()){
                this.isloved = false;
            } else {
                this.isloved = codiLoveStatus.get().getIsLoved();
            }
            this.loveCount = totalLoves;
            this.mainPhotos = mainPhotos.stream().map(photo ->
                    new MainPhotoDTO(photo)).toList();
            this.itemPhotos = itemPhotos.stream().map(photo ->
                    new ItemsPhotoDTO(photo)).toList();
            this.otherCodiPhotos = otherCodiPhotos.stream().map(photo ->
                    new CodiPhotoDTO(photo)).toList();
        }

        @Data
        public class MainPhotoDTO {
            private Integer mainPhotoId;
            private String mainPhotoName;
            private String mainPhotoPath;

            public MainPhotoDTO(Photo mainPhoto) {
                this.mainPhotoId = mainPhoto.getId();
                this.mainPhotoName = mainPhoto.getName();
                this.mainPhotoPath = mainPhoto.getPath();
            }
        }

        @Data
        public class ItemsPhotoDTO {
            private Integer itemsPhotoId;
            private String itemsPhotoName;
            private String itemsPhotoPath;

            public ItemsPhotoDTO(Photo photo) {
                this.itemsPhotoId = photo.getId();
                this.itemsPhotoName = photo.getName();
                this.itemsPhotoPath = photo.getPath();
            }
        }

        @Data
        public class CodiPhotoDTO {
            private Integer codiPhotoId;
            private String codiPhotoName;
            private String codiPhotoPath;

            public CodiPhotoDTO(Photo photo) {
                this.codiPhotoId = photo.getId();
                this.codiPhotoName = photo.getName();
                this.codiPhotoPath = photo.getPath();
            }
        }

    }
}

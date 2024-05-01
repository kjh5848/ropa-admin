package com.example.finalproject.domain.user;

import lombok.Data;

public class UserResponse {

    @Data  // 로그인 성공시 응답 DTO
    public static class LoginDTO {
        private Integer id;
        private String email;
        private String username;

        public LoginDTO(User user) {
            this.id = user.getId();
            this.email = user.getEmail();
            this.username = user.getMyName();
        }
    }

    @Data
    public static class UserListDTO {
        private String myName;
        private String email; // 아이디
        private String mobile; // 연락처
        private String nickName; // 닉네임
        private String instagram; // 인스타그램
        private Boolean isBlueChecked; // 크리에이터 인증

        public UserListDTO(User user) {
            this.myName = user.getMyName();
            this.email = user.getEmail();
            this.mobile = user.getMobile();
            this.nickName = user.getNickName();
            this.instagram = user.getInstagram();
            this.isBlueChecked = user.getBlueChecked();
        }
    }
}

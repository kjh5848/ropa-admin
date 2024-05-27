package com.example.finalproject.domain.user;


import com.example.finalproject._core.utils.ApiUtil;
import com.example.finalproject._core.utils.AppJwtUtil;
import com.example.finalproject._core.utils.JwtVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
public class UserRestController {
    private final UserService userService;
    private final HttpSession session;

    //자동로그인
    @PostMapping("/app/auto/login")
    public ResponseEntity<?> autoLogin(HttpServletRequest request) {
        String accessToken = request.getHeader("Authorization");
        UserResponse.AutoLoginDTO respDTO = userService.autoLogin(accessToken);
        return ResponseEntity.ok(new ApiUtil(respDTO));
    }


    // 앱 프로필 화면
    @GetMapping("/app/profile")
    public ResponseEntity<?> profilePage() {
        SessionUser sessionUser = (SessionUser) session.getAttribute("sessionUser");
        UserResponse.ProfilePage respDTO = userService.profilePage(sessionUser);
        return ResponseEntity.ok(new ApiUtil(respDTO));
    }

    // 앱] 로그인 요청
    @PostMapping("/user/login")
    public ResponseEntity<?> login(@Valid @RequestBody UserRequest.LoginDTO reqDTO, Errors errors) {
        User user = userService.login(reqDTO);
        UserResponse.LoginInfo respDTO = new UserResponse.LoginInfo(user);
        String jwt = AppJwtUtil.create(user);
        return ResponseEntity.ok().header(JwtVO.HEADER, JwtVO.PREFIX + jwt).body(new ApiUtil<>(respDTO)); // header 문법
    }

    // 앱] 로그아웃
    @GetMapping("/user/logout")
    public ResponseEntity<?> logout() {
        session.invalidate();
        return ResponseEntity.ok(new ApiUtil(null));
    }

    // 앱] 회원가입
    @PostMapping("/user/join")
    public ResponseEntity<?> join(@Valid @RequestBody UserRequest.JoinDTO reqDTO, Errors errors) {
        User user = userService.join(reqDTO);
        String jwt = AppJwtUtil.create(user);
        UserResponse.JoinInfo respDTO = new UserResponse.JoinInfo(user);
        return ResponseEntity.ok().header(JwtVO.HEADER, JwtVO.PREFIX + jwt).body(new ApiUtil(respDTO));
    }

    // 앱 세팅 화면 (사용자 정보 변경)
    @GetMapping("/app/setting")
    public ResponseEntity<?> settingPage() {
        SessionUser sessionUser = (SessionUser) session.getAttribute("sessionUser");
        UserResponse.SettingPage respDTO = userService.settingPage(sessionUser);
        return ResponseEntity.ok(new ApiUtil(respDTO));
    }

    // 앱 사용자 크리에이터 지원 페이지
    @GetMapping("/app/creator-apply-form")
    public ResponseEntity<?> creatorApplyPage() {
        SessionUser sessionUser = (SessionUser) session.getAttribute("sessionUser");
        UserResponse.CreatorApply respDTO = userService.creatorApplyPage(sessionUser);
        return ResponseEntity.ok(new ApiUtil(respDTO));
    }

    // 앱 사용자 크리에이터 지원하기
    @PutMapping("/app/creator-apply")
    public ResponseEntity<?> creatorApply(@Valid @RequestBody UserRequest.CreatorApplyDTO creatorApplyDTO, Errors errors) {
        SessionUser sessionUser = (SessionUser) session.getAttribute("sessionUser");
        UserResponse.CreatorApply respDTO = userService.creatorApply(creatorApplyDTO, sessionUser);
        return ResponseEntity.ok(new ApiUtil(respDTO));
    }

    //크리에이터 뷰 페이지
    @GetMapping("/app/creator-view/{userId}")
    public ResponseEntity<?> creatorView(@PathVariable Integer userId) {
        UserResponse.CreatorViewDTO respDTO = userService.creatorView(userId);
        return ResponseEntity.ok(new ApiUtil<>(respDTO));
    }

    //크리에이터 마이 페이지
    @GetMapping("/app/creator-my-page")
    public ResponseEntity<?> creatorMyPage() {
        SessionUser sessionUser = (SessionUser) session.getAttribute("sessionUser");
        UserResponse.CreatorMyPage respDTO = userService.creatorMyPage(sessionUser);
        return ResponseEntity.ok(new ApiUtil<>(respDTO));
    }

    //유저 마이페이지
    @GetMapping("/app/user-my-page")
    public ResponseEntity<?> usrMyPage() {
        SessionUser sessionUser = (SessionUser) session.getAttribute("sessionUser");
        UserResponse.UserMyPage respDTO = userService.userMyPage(sessionUser);
        return ResponseEntity.ok(new ApiUtil<>(respDTO));
    }

    // 유저 아이템, 코디 통합 검색
    @GetMapping("/app/search-all")
    public ResponseEntity<?> searchPage(@RequestParam(defaultValue = "") String keyword) {
        UserResponse.SearchPage respDTO = userService.searchPage(keyword);
        return ResponseEntity.ok(new ApiUtil<>(respDTO));
    }

    // 프로필 변경
    @PutMapping("/user/profile/{userId}")
    public ResponseEntity<?> profileUpdate(@Valid @RequestBody UserRequest.ProfileUpdateDTO reqDTO, Errors errors, @PathVariable(name = "userId") Integer userId) {
        UserResponse.ProfileUpdate respDTO = userService.updateProfile(reqDTO, userId);
        return ResponseEntity.ok(new ApiUtil(respDTO));
    }
}

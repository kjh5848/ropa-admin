package com.example.finalproject.domain.cart;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CartRepository extends JpaRepository<Cart, Integer> {
    // 사용자 장바구니 찾기
    @Query("select c from Cart c join fetch c.items i join fetch i.photos p where c.user.id = :userId")
    List<Cart> findAllByUserId(@Param("userId") Integer userId);

    @Query("select c from Cart c join fetch c.items i join fetch i.admin a where c.user.id = :userId")
    List<Cart> findAllByUserIdWithAdmin(@Param("userId") Integer userId);

    // 사용자 장바구니의 아이템 찾기
    @Query("select c from Cart c join fetch c.items i join fetch c.user u where u.id = :userId and i.id = :itemId")
    Optional<Cart> findByUserAndItem(@Param("userId") Integer userId, @Param("itemId") Integer itemId);

    // 사용자 장바구니 찾으면서 메인포토만 가져오기
    @Query("select c from Cart c join fetch c.items i join fetch i.photos p where p.isMainPhoto = true and c.user.id = :userId")
    List<Cart> findAllByUserIdAndMainPhoto(@Param("userId") Integer userId);
}
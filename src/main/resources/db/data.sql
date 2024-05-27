-- --관리자 테이블--
insert into admin_tb(email, password, brand_name, role, phone, address, business_num, update_at, created_at)
values ('salomon@naver.com', '1234', 'SALOMON', 'BRAND', '010-1111-1111', '서울특별시 강남구', '827-546-7895', NULL, now()),
       ('lee@naver.com', '1234', 'lee', 'BRAND', '010-2222-2222', '서울특별시 종로구', '737-546-7196', NULL, now()),
       ('espionage@naver.com', '1234', 'espionage', 'BRAND', '010-3333-3333', '서울특별시 강동구', '657-546-2897', NULL, now()),
       ('Admin@naver.com', '1234', 'RopaAdmin', 'ADMIN', '010-4444-4444', '부산광역시 해운대구', '1234', NULL, now());


-- 앱 사용자 더미
INSERT INTO user_tb (email, password, nick_name, my_name, address, mobile, height, weight, job, intro_msg, instagram,
                     status, blue_checked, mileage)
VALUES ('junghein@example.com', '1234', 'junghein', '정해인', '서울특별시 강남구', '010-1234-5678', '175cm', '70kg', '직장인',
        '어깨 넓은 보통 체형',
        'holyhaein', '신청 전', FALSE, 0),
       ('limsiwan@example.com', '1234', 'limsiwan', '임시완', '경기도 분당구', '010-9876-5432', '168cm', '56kg', '학생',
        '키작고 마른 체형', 'yim_siwang',
        '승인 대기', FALSE, 0),
       ('bunwuseok@example.com', '1234', 'bunwuseok', '변우석', '인천광역시 남동구', '010-3333-3333', '180cm', '75kg', '직장인',
        '연예인 체형', 'byeonwooseok',
        '승인', TRUE, 3000),
       ('gd@example.com', '1234', 'gd', '김지용', '인천광역시 남동구', '010-5555-5555', '180cm', '70kg', '학생',
        '키크고 마른 체형', 'xxxibgdrgn',
        '신청 전', FALSE, 0),
       ('kimsuhyun@example.com', '1234', 'kimsuhyun', '김수현', '인천광역시 남동구', '010-6666-6666', '180cm', '85kg', '학생',
        '키크고 덩치가 있는 체형', 'soohyun_k216',
        '신청 전', FALSE, 0),
       ('wehajun@example.com', '1234', 'wehajun', '위하준', '서울특별시 강남구', '010-7777-7777', '180cm', '75kg', '직장인',
        '연예인 체형', 'wi__wi__wi',
        '승인', TRUE, 3000),
       ('jisung@example.com', '1234', 'jisung', '지성', '서울특별시 노원구', '010-8888-8888', '180cm', '75kg', '직장인',
        '상체가 있는 체형', 'justin_jisung',
        '승인', TRUE, 3000),
       ('hwangminhyun@example.com', '1234', 'hwangminhyun', '황민현', ' 남동구', '010-9999-9999', '178cm', '72kg', '학생',
        '평범한 체형', 'optimushwang',
        '승인', TRUE, 3000),
       ('seokangjoon@example.com', '1234', 'seokangjoon', '서강준', '인천광역시 남동구', '010-1212-1212', '182cm', '75kg', '학생',
        '모델 체형', 'seokj1012',
        '승인', TRUE, 3000),
       ('kimheechul@example.com', '1234', 'kimheechul', '김희철', '인천광역시 남동구', '010-3434-3434', '176cm', '65kg', '직장인',
        '하체가 길어 키가 커보이는 체형', 'kimheenim',
        '승인', TRUE, 3000);

-- 카테고리 테이블 더미
INSERT INTO category_tb (main, sub)
VALUES ('top', '반팔'),
       ('bottom', '청바지'),
       ('top', '반팔 셔츠'),
       ('bottom', '카고 팬츠'),
       ('top', '니트'),
       ('bottom', '청바지'),
       ('top', '니트 집업'),
       ('bottom', '청바지'),
       ('top', '크롭 숏 가디건 자켓'),
       ('bottom', '슬랙스'),
       ('top', '셔츠'),
       ('top', '티셔츠'),
       ('bottom', '슬랙스'),
       ('top', '반팔 니트 가디건'),
       ('bottom', '슬랙스'),
       ('top', '라운드 니트'),
       ('bottom', '슬랙스'),
       ('top', '반팔'),
       ('bottom', '슬랙스');


-- 아이템(Items) 더미 데이터 삽입
INSERT INTO items_tb (admin_id, name, description, size, price, discount_price, stock, category_id, status)
VALUES (1, 'SCRAPPED 티셔츠(WHITE)', '힙하고 유니크한 반팔로 어느 코디에도 잘 어울립니다.', 'M', 45000, 0, 100, 1, true),
       (1, 'scratch 블루 청바지', '봄, 여름, 가을 까지 계절 상관없이 힙한 룩에 잘어울리는 청바지입니다.', 'L', 32000, 0, 50, 2, true),
       (2, 'CHAIN STITCH OPEN COLLAR HALF SHIRT_BLACK', '빈티지 무드의 자수 그래픽이 사용된 오픈 카라 셔츠입니다.', 'L', 55000, 0, 200, 3, true),
       (2, '나일론 립스탑 유틸리티 팬츠_BLACK', '현대식 디자인에 맞춘 카고 팬츠입니다.', 'M', 50000, 0, 100, 4, true),
       (3, 'crop cable sweater', '방모 원사임에도 모달이 섞여 기분좋은 찰랑거림이 있는게 매력적입니다.', 'L', 75000, 0, 50, 5, true),
       (3, '라이트블루 데님팬츠', '셀비지 원단으로 만들어진 라이트 불루 데님.', 'L', 40000, 0, 200, 6, true),
       (1, 'Bulky wool full zip knit', '고급스러운 컬러감을 선택하여 단품으로도 한겨울에 이너로도 활용도가 높은 아이템.', 'L', 59000, 0, 100, 7, true),
       (1, 'Two Tuck Wide Black Jeans', '투턱 디테일과 사선 포켓 활용으로 입체적인 핏 감의 네츄럴한 무드 연출.', 'L', 32000, 0, 50, 8, true),
       (2, '크롭 숏 가디건 자켓', 'Basic하면서 유니크한 디자인으로 기본으로 입어도 좋고 이너로 입어도 잘 어울리는 가디건입니다.', 'L', 75000, 0, 200, 9, true),
       (2, '투턱 세미 와이드 슬랙스', '투턱 와이드의 정석으로 어느 상의와도 매치하기 좋습니다.', 'M', 50000, 0, 100, 10, true),
       (2, '오버핏 미니멀 셔츠 남방', '미니멀 셔츠 남방으로 이너로도 입기 좋고 쌀쌀 할 때 가디건 하나 걸쳐도 잘어룰리는 룩입니다.', 'XL', 43000, 0, 50, 11, true),
       (3, '오버핏 무지 티셔츠', '간절기에 입기 좋은 무지 티셔츠입니다.', 'XL', 43000, 0, 200, 12, true),
       (3, '코튼 면팬츠 와이드 슬랙스', '코튼 면팬츠 와이드 슬랙스의 정석으로 어느 상의와도 잘 어룰리는 와이드 슬랙스 입니다.', 'M', 50000, 0, 100, 13, true),
       (1, '반팔 니트 가디건', '여름에 입을 수 있는 가디건으로 이너와 아우터로 착용 가능합니다.', 'L', 75000, 0, 50, 14, true),
       (1, '핀턱 와이드 슬랙스 팬츠', '핀턱이 잡혀있고 재질이 얇아 여름에 입기 좋은 상품입니다.', 'L', 50000, 0, 200, 15, true),
       (2, '긴팔 라운드 니트', '간절기에 입기 좋은 재질로 구성됐습니다.', 'L', 50000, 0, 100, 16, true),
       (2, '다리가 길어보이는 투턱 세미 와이드 슬랙스 팬츠', '다리가 길어보이는 투턱 세미 와이드 팬츠로 어느룩에든 잘 어울립니다.', 'L', 75000, 0, 50, 17, true),

       (4, '린넨 쿨링 3버튼 카라 반팔', '시원한 린넨 쿨링 3버튼 카라 반팔, 여름에 딱!', 'M', 29000, 0, 100, 18, true),
       (4, '[비침 X] 2TYPE 린넨 쿨링 밴딩 팬츠', '비침 없는 쿨링 린넨 팬츠, 여름 필수템!', 'M', 35000, 0, 100, 19, true);


-- 장바구니 더미데이터
INSERT INTO cart_tb (user_id, items_id, quantity, total_amount)
VALUES (1, 1, 2, 90000),
       (1, 2, 1, 32000),
       (2, 3, 1, 55000),
       (2, 4, 1, 50000),
       (3, 5, 1, 75000),
       (3, 6, 1, 40000),
       (4, 7, 1, 59000),
       (4, 8, 1, 32000),
       (5, 9, 1, 75000),
       (5, 10, 1, 50000),
       (3, 7, 1,  59000),
       (3, 8, 1,  32000);


-- 코디 테이블 더미
insert into codi_tb (user_id, description, created_at)
values (3, '톤온톤 매치로 보편적이지 않은 매치지만 기본 디자인으로 꾸안꾸 느낌의 룩입니다.', NOW()),
       (3, '집 앞 카페에 갈 때 꾸민듯 안꾸민듯의 정석인 룩입니다.', NOW()),
       (6, '전형적인 봄의 남자의 정석 룩 입니다.', NOW()),
       (6, '선선하니 바닷가에 놀러갈 때 입기 좋은 룩입니다.', NOW()),
       (6, '부담스럽지 않게 자연스럽게 스며 들 수 있는 꾸안 꾸 룩입니다.', NOW()),
       (6, '복학생 선배가 트랜드에 뒤쳐지지 않아 보이는 룩 입니다.', NOW()),
       (10, '여름 바캉스 갈때 입기 좋은 룩입니다.', NOW()),
       (10, '힙하게 이미지가 강렬하게 보이고 싶을 때 추천드리는 룩입니다.', NOW()),
       (7, '여름철 발을 시원하게 해줄 슬리퍼는 필수 아이템입니다. 가볍고 편안한 디자인으로 일상에서도, 해변에서도 활용하기 좋습니다.', NOW()),
       (7, '통기성이 좋은 린넨 셔츠는 여름철 더위를 식혀줄 최고의 선택입니다. 다양한 색상으로 스타일링하기도 좋아요! ', NOW()),
       (7, '기본 아이템인 반팔 티셔츠는 여름에 필수입니다. 밝은 색상이나 그래픽 디자인으로 포인트를 주면 더욱 멋스럽습니다.', NOW()),
       (7, '면이나 린넨 소재의 쇼츠는 시원하면서도 활동성을 높여줍니다. 티셔츠와 매치하면 간편하고 멋스러운 여름 스타일을 완성할 수 있습니다.', NOW()),
       (7, '아침저녁으로 선선한 날씨에 대비해 가벼운 재킷을 준비하세요. 얇고 통기성이 좋은 소재로 선택하면 스타일과 실용성을 동시에 잡을 수 있습니다.', NOW()),
       (7, '여름에도 스타일리시하게 입을 수 있는 슬림 핏 치노 팬츠는 다양한 상의와 잘 어울립니다. 밝은 색상으로 시원한 느낌을 더해보세요.', NOW()),
       (8, '깔끔한 셔츠와 슬랙스로 완성한 프로페셔널 룩', NOW()),
       (8, '포멀하지만 편안한 스타일의 정장 셋업', NOW()),
       (9, '가벼운 면 티셔츠와 데님 쇼츠로 캐주얼한 여름 스타일', NOW()),
       (9, '편안한 폴로 셔츠와 치노 팬츠로 세련된 일상 룩', NOW()),
       (9, '통기성 좋은 린넨 셔츠와 슬랙스로 시원하게', NOW()),
       (9, '스포티한 반팔 티셔츠와 조거 팬츠로 활동성을 높이세요', NOW()),
       (9, '심플한 라운드넥 티셔츠와 면 반바지로 편안한 하루를', NOW());


-- 코디랑 아이템을 연결해주는 테이블
insert into codi_items_tb (items_id, codi_id)
values (5, 1),
       (6, 1),
       (7, 2),
       (8, 2),
       (9, 3),
       (10, 3),
       (11, 3),
       (12, 4),
       (13, 4),
       (14, 5),
       (15, 5),
       (16, 6),
       (17, 6),
       (1, 7),
       (2, 7),
       (3, 8),
       (4, 8),
       (18, 9),
       (19, 9);

-- 사진 테이블 더미
insert into photo_tb (uuid_name, original_file_name, path, sort, admin_id, user_id, codi_id, items_id, created_at,
                      is_main_photo)
values ('uuid_브랜드사진1', 'salomon', '/upload/brand/salomon.jpg', 'BRAND', 1, null, null, null, NOW(), true),
       ('uuid_브랜드사진2', 'lee', '/upload/brand/lee.png', 'BRAND', 2, null, null, null, NOW(), true),
       ('uuid_브랜드사진3', 'espionage', '/upload/brand/espionage.png', 'BRAND', 3, null, null, null, NOW(), true),
       ('uuid_사용자사진1', '사용자사진1', '/upload/user/user1.webp', 'USER', null, 1, null, null, NOW(), true),
       ('uuid_사용자사진2', '사용자사진2', '/upload/user/user2.webp', 'USER', null, 2, null, null, NOW(), true),
       ('uuid_사용자사진3', '사용자사진3', '/upload/user/user3.webp', 'USER', null, 3, null, null, NOW(), true),
       ('uuid_사용자사진4', '사용자사진4', '/upload/user/user4.webp', 'USER', null, 4, null, null, NOW(), true),
       ('uuid_사용자사진5', '사용자사진5', '/upload/user/user5.webp', 'USER', null, 5, null, null, NOW(), true),
       ('uuid_사용자사진6', '사용자사진6', '/upload/user/user6.webp', 'USER', null, 6, null, null, NOW(), true),
       ('uuid_사용자사진7', '사용자사진7', '/upload/user/user7.webp', 'USER', null, 7, null, null, NOW(), true),
       ('uuid_사용자사진8', '사용자사진8', '/upload/user/user8.webp', 'USER', null, 8, null, null, NOW(), true),
       ('uuid_사용자사진9', '사용자사진9', '/upload/user/user9.webp', 'USER', null, 9, null, null, NOW(), true),
       ('uuid_사용자사진10', '사용자사진10', '/upload/user/user10.webp', 'USER', null, 10, null, null, NOW(), true),

-- 코디 수정 (user_id)
       ('uuid_코디사진1', '코디사진1', '/upload/codi/user-03-codi01.webp', 'CODI', null, null, 1, null, NOW(), true),
       ('uuid_코디사진1서브', '코디사진1서브', '/upload/codi/user-03-codi01-detail.webp', 'CODI', null, null, 1, null, NOW(), false),
       ('uuid_코디사진2', '코디사진2', '/upload/codi/user-03-codi02.webp', 'CODI', null, null, 2, null, NOW(), true),
       ('uuid_코디사진2서브', '코디사진2서브', '/upload/codi/user-03-codi02-detail.webp', 'CODI', null, null, 2, null, NOW(), false),
       ('uuid_코디사진3', '코디사진3', '/upload/codi/user-06-codi01.jpg', 'CODI', null, null, 3, null, NOW(), true),
       ('uuid_코디서브사진3', '코디서브사진3', '/upload/codi/user-06-codi01-detail.jpg', 'CODI', null, null, 3, null, NOW(), false),
       ('uuid_코디사진4', '코디사진4', '/upload/codi/user-06-codi02.jpg', 'CODI', null, null, 4, null, NOW(), true),
       ('uuid_코디서브사진4', '코디서브사진4', '/upload/codi/user-06-codi02-detail.jpg', 'CODI', null, null, 4, null, NOW(), false),
       ('uuid_코디사진5', '코디사진5', '/upload/codi/user-06-codi03.jpg', 'CODI', null, null, 5, null, NOW(), true),
       ('uuid_코디서브사진5', '코디서브사진5', '/upload/codi/user-06-codi03-detail.jpg', 'CODI', null, null, 5, null, NOW(), false),
       ('uuid_코디사진6', '코디사진6', '/upload/codi/user-06-codi04.jpg', 'CODI', null, null, 6, null, NOW(), true),
       ('uuid_코디서브사진6', '코디서브사진6', '/upload/codi/user-06-codi04-detail.jpg', 'CODI', null, null, 6, null, NOW(), false),
       ('uuid_코디사진7', '코디사진7', '/upload/codi/user-10-codi01.jpg', 'CODI', null, null, 7, null, NOW(), true),
       ('uuid_코디사진7서브', '코디사진7서브', '/upload/codi/user-10-codi01-detail.jpg', 'CODI', null, null, 7, null, NOW(), false),
       ('uuid_코디사진8', '코디사진8', '/upload/codi/user-10-codi02.jpg', 'CODI', null, null, 8, null, NOW(), true),
       ('uuid_코디사진8서브', '코디사진8서브', '/upload/codi/user-10-codi02-detail.jpg', 'CODI', null, null, 8, null, NOW(), false),
       -- 코디 추가
       -- user 07
       ('uuid_코디사진9', '코디사진9', '/upload/codi/user-07-codi01.jpg', 'CODI', null, null, 9, null, NOW(), true),
       ('uuid_코디사진9서브', '코디사진9서브', '/upload/codi/user-07-codi01-detail.jpg', 'CODI', null, null, 9, null, NOW(), false),
       ('uuid_코디사진10', '코디사진10', '/upload/codi/user-07-codi02.jpg', 'CODI', null, null, 10, null, NOW(), true),
       ('uuid_코디사진10서브', '코디사진10서브', '/upload/codi/user-07-codi02-detail.jpg', 'CODI', null, null, 10, null, NOW(), false),
       ('uuid_코디사진11', '코디사진11', '/upload/codi/user-07-codi03.jpg', 'CODI', null, null, 11, null, NOW(), true),
       ('uuid_코디사진11서브', '코디사진11서브', '/upload/codi/user-07-codi03-detail.jpg', 'CODI', null, null, 11, null, NOW(), false),
       ('uuid_코디사진12', '코디사진12', '/upload/codi/user-07-codi04.jpg', 'CODI', null, null, 12, null, NOW(), true),
       ('uuid_코디사진12서브', '코디사진12서브', '/upload/codi/user-07-codi04-detail.jpg', 'CODI', null, null, 12, null, NOW(), false),
       ('uuid_코디사진13', '코디사진13', '/upload/codi/user-07-codi05.jpg', 'CODI', null, null, 13, null, NOW(), true),
       ('uuid_코디사진13서브', '코디사진13서브', '/upload/codi/user-07-codi05-detail.jpg', 'CODI', null, null, 13, null, NOW(), false),
       ('uuid_코디사진14', '코디사진14', '/upload/codi/user-07-codi06.jpg', 'CODI', null, null, 14, null, NOW(), true),
       ('uuid_코디사진14서브', '코디사진14서브', '/upload/codi/user-07-codi06-detail.jpg', 'CODI', null, null, 14, null, NOW(), false),
       -- user08
       ('uuid_코디사진15', '코디사진15', '/upload/codi/user-08-codi01.jpg', 'CODI', null, null, 15, null, NOW(), true),
       ('uuid_코디사진15서브', '코디사진15서브', '/upload/codi/user-08-codi01-detail.jpg', 'CODI', null, null, 15, null, NOW(), false),
       ('uuid_코디사진16', '코디사진16', '/upload/codi/user-08-codi02.jpg', 'CODI', null, null, 16, null, NOW(), true),
       ('uuid_코디사진16서브', '코디사진16서브', '/upload/codi/user-08-codi02-detail.jpg', 'CODI', null, null, 16, null, NOW(), false),
       -- user09
       ('uuid_코디사진17', '코디사진17', '/upload/codi/user-09-codi01.jpg', 'CODI', null, null, 17, null, NOW(), true),
       ('uuid_코디사진17서브', '코디사진17서브', '/upload/codi/user-09-codi01-detail.jpg', 'CODI', null, null, 17, null, NOW(), false),
       ('uuid_코디사진18', '코디사진18', '/upload/codi/user-09-codi02.jpg', 'CODI', null, null, 18, null, NOW(), true),
       ('uuid_코디사진18서브', '코디사진18서브', '/upload/codi/user-09-codi02-detail.jpg', 'CODI', null, null, 18, null, NOW(), false),
       ('uuid_코디사진19', '코디사진19', '/upload/codi/user-09-codi03.jpg', 'CODI', null, null, 19, null, NOW(), true),
       ('uuid_코디사진19서브', '코디사진19서브', '/upload/codi/user-09-codi03-detail.jpg', 'CODI', null, null, 19, null, NOW(), false),
       ('uuid_코디사진20', '코디사진20', '/upload/codi/user-09-codi04.jpg', 'CODI', null, null, 20, null, NOW(), true),
       ('uuid_코디사진20서브', '코디사진20서브', '/upload/codi/user-09-codi04-detail.jpg', 'CODI', null, null, 20, null, NOW(), false),
       ('uuid_코디사진21', '코디사진21', '/upload/codi/user-09-codi05.jpg', 'CODI', null, null, 21, null, NOW(), true),
       ('uuid_코디사진21서브', '코디사진21서브', '/upload/codi/user-09-codi05-detail.jpg', 'CODI', null, null, 21, null, NOW(), false),

       ('uuid_아이템사진1', '아이템사진1', '/upload/items/item01/mainItemPhoto.jpg', 'ITEM', null, null, null, 1, NOW(), true),
       ('uuid_아이템사진1서브', '아이템서브사진1', '/upload/items/item01/detail01.jpg', 'ITEM', null, null, null, 1, NOW(), false),
       ('uuid_아이템사진2', '아이템사진2', '/upload/items/item02/mainItemPhoto.jpg', 'ITEM', null, null, null, 2, NOW(), true),
       ('uuid_아이템사진2서브', '아이템사진서브사진2', '/upload/items/item02/detail01.jpg', 'ITEM', null, null, null, 2, NOW(), false),
       ('uuid_아이템사진3', '아이템사진사진3', '/upload/items/item03/mainItemPhoto.jpg', 'ITEM', null, null, null, 3, NOW(), true),
       ('uuid_아이템사진3서브', '아이템사진서브사진3', '/upload/items/item03/detail01.jpg', 'ITEM', null, null, null, 3, NOW(), false),
       ('uuid_아이템사진4', '아이템사진사진4', '/upload/items/item04/mainItemPhoto.jpg', 'ITEM', null, null, null, 4, NOW(), true),
       ('uuid_아이템사진4서브', '아이템사진서브사진4', '/upload/items/item04/detail01.jpg', 'ITEM', null, null, null, 4, NOW(), false),
       ('uuid_아이템사진5', '아이템사진사진5', '/upload/items/item05/mainItemPhoto.jpg', 'ITEM', null, null, null, 5, NOW(), true),
       ('uuid_아이템사진5서브', '아이템사진서브사진5', '/upload/items/item05/detail01.jpg', 'ITEM', null, null, null, 5, NOW(), false),
       ('uuid_아이템사진6', '아이템사진사진6', '/upload/items/item06/mainItemPhoto.jpg', 'ITEM', null, null, null, 6, NOW(), true),
       ('uuid_아이템사진6서브', '아이템사진서브사진6', '/upload/items/item06/detail01.jpg', 'ITEM', null, null, null, 6, NOW(), false),
       ('uuid_아이템사진6서브', '아이템사진서브사진6', '/upload/items/item06/detail02.jpg', 'ITEM', null, null, null, 6, NOW(), false),
       ('uuid_아이템사진6서브', '아이템사진서브사진6', '/upload/items/item06/detail03.jpg', 'ITEM', null, null, null, 6, NOW(), false),
       ('uuid_아이템사진6서브', '아이템사진서브사진6', '/upload/items/item06/detail04.jpg', 'ITEM', null, null, null, 6, NOW(), false),
       ('uuid_아이템사진7', '아이템사진사진7', '/upload/items/item07/mainItemPhoto.jpg', 'ITEM', null, null, null, 7, NOW(), true),
       ('uuid_아이템사진7서브', '아이템사진서브사진7', '/upload/items/item07/detail01.jpg', 'ITEM', null, null, null, 7, NOW(), false),
       ('uuid_아이템사진8', '아이템사진사진8', '/upload/items/item08/mainItemPhoto.jpg', 'ITEM', null, null, null, 8, NOW(), true),
       ('uuid_아이템사진8서브', '아이템사진서브사진8', '/upload/items/item08/detail01.jpg', 'ITEM', null, null, null, 8, NOW(), false),
       ('uuid_아이템사진9', '아이템사진9', '/upload/items/item09/mainItemPhoto.jpg', 'ITEM', null, null, null, 9, NOW(), true),
       ('uuid_아이템사진9서브', '아이템서브사진9', '/upload/items/item09/detail01.jpg', 'ITEM', null, null, null, 9, NOW(), false),
       ('uuid_아이템사진10', '아이템사진10', '/upload/items/item10/mainItemPhoto.jpg', 'ITEM', null, null, null, 10, NOW(), true),
       ('uuid_아이템사진10서브', '아이템서브사진10', '/upload/items/item10/detail01.jpg', 'ITEM', null, null, null, 10, NOW(), false),
       ('uuid_아이템사진11', '아이템사진11', '/upload/items/item11/mainItemPhoto.jpg', 'ITEM', null, null, null, 11, NOW(), true),
       ('uuid_아이템사진서브11', '아이템서브사진11', '/upload/items/item11/detail01.jpg', 'ITEM', null, null, null, 11, NOW(), false),
       ('uuid_아이템사진12', '아이템사진12', '/upload/items/item12/mainItemPhoto.jpg', 'ITEM', null, null, null, 12, NOW(), true),
       ('uuid_아이템사진12서브', '아이템서브사진12', '/upload/items/item12/detail01.jpg', 'ITEM', null, null, null, 12, NOW(), false),
       ('uuid_아이템사진13', '아이템사진13', '/upload/items/item13/mainItemPhoto.jpg', 'ITEM', null, null, null, 13, NOW(), true),
       ('uuid_아이템사진13서브', '아이템서브사진13', '/upload/items/item13/detail01.jpg', 'ITEM', null, null, null, 13, NOW(), false),
       ('uuid_아이템사진14', '아이템사진14', '/upload/items/item14/mainItemPhoto.jpg', 'ITEM', null, null, null, 14, NOW(), true),
       ('uuid_아이템사진14서브', '아이템서브사진14', '/upload/items/item14/detail01.jpg', 'ITEM', null, null, null, 14, NOW(), false),
       ('uuid_아이템사진15', '아이템사진15', '/upload/items/item15/mainItemPhoto.jpg', 'ITEM', null, null, null, 15, NOW(), true),
       ('uuid_아이템사진15서브', '아이템서브사진15', '/upload/items/item15/detail01.jpg', 'ITEM', null, null, null, 15, NOW(), false),
       ('uuid_아이템사진16', '아이템사진16', '/upload/items/item16/mainItemPhoto.jpg', 'ITEM', null, null, null, 16, NOW(), true),
       ('uuid_아이템사진16서브', '아이템서브사진16', '/upload/items/item16/detail01.jpg', 'ITEM', null, null, null, 16, NOW(), false),
       ('uuid_아이템사진17', '아이템사진17', '/upload/items/item17/mainItemPhoto.jpg', 'ITEM', null, null, null, 17, NOW(), true),
       ('uuid_아이템사진17서브', '아이템서브사진17', '/upload/items/item17/detail01.jpg', 'ITEM', null, null, null, 17, NOW(), false),
        -- user-07-codi01
       ('uuid_아이템사진18', '아이템사진18', '/upload/items/item18/mainItemPhoto.jpg', 'ITEM', null, null, null, 18, NOW(), true),
       ('uuid_아이템사진18서브', '아이템서브사진18', '/upload/items/item18/detail01.jpg', 'ITEM', null, null, null, 18, NOW(), false),
       ('uuid_아이템사진19', '아이템사진19', '/upload/items/item19/mainItemPhoto.jpg', 'ITEM', null, null, null, 19, NOW(), true),
       ('uuid_아이템사진19서브', '아이템서브사진19', '/upload/items/item19/detail01.jpg', 'ITEM', null, null, null, 19, NOW(), false);

-- 좋아요 기능
insert into love_tb (user_id, codi_id, is_loved)
values (1, 2, true),
       (2, 3, true),
       (3, 4, true),
       (4, 5, true),
       (5, 6, true),
       (6, 7, true),
       (7, 8, true),
       (8, 1, true),
       (10, 9, true),
       (10, 10, true),
       (9, 11, true),
       (8, 12, true),
       (7, 13, true),
       (6, 14, true),
       (5, 15, true),
       (4, 16, true),
       (3, 17, true),
       (2, 18, true),
       (1, 19, true),
       (2, 20, true),
       (3, 21, true);


-- 배송(Delivery) 더미 데이터 삽입
INSERT INTO delivery_tb (status, start_date, end_date, recipient, postal_code, address, address_detail, phone_number)
VALUES ('배송중', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '정해인', '12345', '서울특별시 강남구', '테헤란로 123길', '010-1234-5678'),
       ('배송완료', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '임시완', '54321', '경기도 분당구', '판교로 456번길', '010-9876-5432'),
       ('배송중', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '변우석', '98765', '인천광역시 남동구', '구월로 789번길', '010-3333-3333'),
       ('배송중', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '김지용', '48574', '인천광역시 남동구', '구월로 788번길', '010-5555-5555'),
       ('배송중', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '김수현', '34983', '인천광역시 남동구', '구월로 787번길', '010-6666-6666');

-- 주문(Order) 더미 데이터 삽입
INSERT INTO order_tb (user_id, delivery_id, purchase_amount, fee, order_date, delivery_type, pay_method)
VALUES (1, 1, 122000, 12200, CURRENT_TIMESTAMP, 'FREE', 'CREDIT'),
       (2, 2, 105000, 10500, CURRENT_TIMESTAMP, 'FREE', 'CREDIT'),
       (3, 3, 206000, 20600, CURRENT_TIMESTAMP, 'FREE', 'CREDIT'),
       (4, 4, 91000, 9100, CURRENT_TIMESTAMP, 'FREE', 'CREDIT'),
       (5, 5, 125000, 12500, CURRENT_TIMESTAMP, 'FREE', 'CREDIT');


INSERT INTO inquiry_tb (status, title, content, comment, user_id, admin_id, commented_at, created_at)
VALUES (true, '상품 문의', '상품이 반팔도 셔츠도 입고 되면 좋겠는데  혹시 안 되나요?.', '출시 예정 제품 있습니다! 1월 27일 11:00부로 상품 구매 가능합니다!', 1, 1,
        '2024-01-26 11:30:00', '2024-01-25 11:30:00'),
       (true, '배송 문의', '주문한 상품이 아직 배송되지 않았습니다.', '평균 배송 2~3일 걸립니다!', 1, 1, '2024-02-18 09:00:00',
        '2024-02-16 01:00:00'),
       (false, '상품 문의', '배송중 상품 교환이 가능한가요?', '', 1, 1, null, NOW()),
       (false, '상품 문의', '반팔 카라티 모델이 차은우인가요?', '', 3, 2, null, NOW()),
       (false, '옷 사이즈 질문드립니다', '총 기장과 가슴 폭좀 알려주세요', '', 2, 2, null, NOW()),
       (false, '혀가 거짓말을 하면?', '전혀 아니에요..', '', 4, 1, null, NOW()),
       (false, '스님이 공중부양 하면?', '어중이 떠중이', '', 5, 1, null, NOW()),
       (false, '여자 : 좋은 소식과 나쁜 소식이 있어. 우리 헤어지자.', '남자 : 그럼 나쁜 소식은?', '', 1, 3, null, NOW()),
       (false, '상품 문의', '저희 사이즈는 프리사이즈 밖에 없나요?', '', 3, 2, null, NOW());

-- 주문 상세(OrderHistory) 더미 데이터 삽입
INSERT INTO order_history_tb (admin_id, order_id, items_id, order_item_qty, order_item_price, fee)
VALUES (1, 1, 1, 2, 90000, 9000),
       (1, 1, 2, 1, 32000, 3200),
       (2, 2, 3, 1, 55000, 5500),
       (2, 2, 4, 1, 50000, 3200),
       (3, 3, 5, 1, 75000, 7500),
       (3, 3, 6, 1, 40000, 4000),
       (1, 3, 7, 1, 59000, 5900),
       (1, 3, 8, 1, 32000, 3200),
       (1, 4, 7, 1, 59000, 5900),
       (1, 4, 8, 1, 32000, 3200),
       (2, 5, 9, 1, 75000, 7500),
       (2, 5, 10, 1, 50000, 5000);

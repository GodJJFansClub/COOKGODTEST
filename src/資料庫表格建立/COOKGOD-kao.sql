-----------------------------------------------------------------
--推播通知--
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B00001',SYSDATE,'NO1:訂單推撥通知',0,'a00001');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B00002',SYSDATE,'NO2:訂單推撥通知',0,'a00002');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B00003',SYSDATE,'NO3:訂單推撥通知',0,'a00003');
------------------------------------------------------------------
--喜愛主廚--
INSERT INTO FAV_CHEF(CUST_ID,CHEF_ID)
VALUES('a00001','T00002');
INSERT INTO FAV_CHEF(CUST_ID,CHEF_ID)
VALUES('a00002','T00002');
INSERT INTO FAV_CHEF(CUST_ID,CHEF_ID)
VALUES('a00003','T00002');
INSERT INTO FAV_CHEF(CUST_ID,CHEF_ID)
VALUES('b00001','T00002');
INSERT INTO FAV_CHEF(CUST_ID,CHEF_ID)
VALUES('c00002','T00002');
---------------------------------------------------------------
--嚴選套餐--
INSERT INTO MENU(MENU_ID,MENU_NAME,MENU_RESUME,MENU_PIC,MENU_STATUS,MENU_PRICE)
VALUES('M00002','大富豪盆菜','今（2019）年推出全新年菜佳餚「大富豪盆菜」（售價$16,800元）。傳統的盆菜據傳源自南宋末年，已有數百年的歷史，是廣東、廣州、深圳和香港新界的漢族飲食習俗，代表「闔家團圓」之意。主廚特別選用八頭鮑魚、金蠔、烏參、瑤柱、蘿蔔、白菜、花菇、鴨、雞、蓮藕和油浸筍殼魚，先將所有食材分開滷好備用，再以白菜為底，層層將食材擺上，最後淋上勾芡的雞高湯，味道馥郁而香濃。',hextoraw('0'),0,16800);
INSERT INTO MENU(MENU_ID,MENU_NAME,MENU_RESUME,MENU_PIC,MENU_STATUS,MENU_PRICE)
VALUES('M00003','故宮晶華圍爐宴','「故宮晶華圍爐宴」（售價$6,888元），結合6道精緻開胃前菜、2道主菜和1盅故宮御品佛跳牆，相當澎湃美味。另有推出以5款珍稀食材入饌的「五福臨門金元寶」手工水餃，還有「白玉鳳眼」和「乾坤燒蹄」2款阿舍宴的經典菜色。',hextoraw('0'),0,6888);
INSERT INTO MENU(MENU_ID,MENU_NAME,MENU_RESUME,MENU_PIC,MENU_STATUS,MENU_PRICE)
VALUES('M00004','花開富貴團圓宴','「花開富貴團圓宴」外帶年菜。不僅有集結8道佳餚的「花開富貴團圓宴－圍爐外帶年菜套餐」（6人份），每套售價$8,888元；更獨家推出限量的「土雞瑤柱燉排翅」和古法秘製的「老雞上湯佛跳牆」。',hextoraw('0'),0,8888);
------------------------------------------------------------------
--主廚食材訂單--
INSERT INTO CHEF_ORDER(CHEF_OR_ID,CHEF_OR_STATUS,CHEF_OR_START,CHEF_OR_SEND,CHEF_OR_NAME,CHEF_OR_ADDR,CHEF_OR_TEL,CHEF_ID)
VALUES(110001,0,SYSDATE,TO_DATE('2019-02-11'),'David','桃園市中壢區中大路300號',32885252,'T00002');
INSERT INTO CHEF_ORDER(CHEF_OR_ID,CHEF_OR_STATUS,CHEF_OR_START,CHEF_OR_SEND,CHEF_OR_NAME,CHEF_OR_ADDR,CHEF_OR_TEL,CHEF_ID)
VALUES(110002,0,SYSDATE,TO_DATE('2019-02-11'),'Peter','桃園市中壢區中大路300號',32885252,'T00002');
INSERT INTO CHEF_ORDER(CHEF_OR_ID,CHEF_OR_STATUS,CHEF_OR_START,CHEF_OR_SEND,CHEF_OR_NAME,CHEF_OR_ADDR,CHEF_OR_TEL,CHEF_ID)
VALUES(110003,0,SYSDATE,TO_DATE('2019-02-11'),'Amy','桃園市中壢區中大路300號',32885252,'T00002');
INSERT INTO CHEF_ORDER(CHEF_OR_ID,CHEF_OR_STATUS,CHEF_OR_START,CHEF_OR_SEND,CHEF_OR_NAME,CHEF_OR_ADDR,CHEF_OR_TEL,CHEF_ID)
VALUES(110004,0,SYSDATE,TO_DATE('2019-02-11'),'Tom','桃園市中壢區中大路300號',32885252,'T00002');
INSERT INTO CHEF_ORDER(CHEF_OR_ID,CHEF_OR_STATUS,CHEF_OR_START,CHEF_OR_SEND,CHEF_OR_NAME,CHEF_OR_ADDR,CHEF_OR_TEL,CHEF_ID)
VALUES(110005,0,SYSDATE,TO_DATE('2019-02-11'),'Candy','桃園市中壢區中大路300號',32885252,'T00002');
-----------------------------------------------------------------------------------------------------------------------------------
--主廚食材訂單明細--
--INSERT INTO CHEF_OD_DETAIL(CHEF_OR_ID,FOOD_SUP_ID,FOOD_ID,CHEF_OD_QTY,CHEF_OD_STOTAL)
--VALUES('110001','T00003','F00001',1,199);
-----------------------------------------------------------------------------------------------------------------------------------
--+ holdcas on;
set names utf8;
CREATE TABLE coll_test (id INTEGER, s VARCHAR(10) collate utf8_gen);

INSERT INTO coll_test (id, s) values (0, 'x');
INSERT INTO coll_test (id, s) values (233, 'Xz');
INSERT INTO coll_test (id, s) values (229, 'xyx');
INSERT INTO coll_test (id, s) values (225, 'xy');
INSERT INTO coll_test (id, s) values (221, 'Xx');
INSERT INTO coll_test (id, s) values (217, 'xwx');
INSERT INTO coll_test (id, s) values (213, 'xw');
INSERT INTO coll_test (id, s) values (209, 'Xv');
INSERT INTO coll_test (id, s) values (205, 'xùx');
INSERT INTO coll_test (id, s) values (201, 'xux');
INSERT INTO coll_test (id, s) values (197, 'xù');
INSERT INTO coll_test (id, s) values (193, 'xú');
INSERT INTO coll_test (id, s) values (189, 'xu');
INSERT INTO coll_test (id, s) values (185, 'Xt');
INSERT INTO coll_test (id, s) values (181, 'xsx');
INSERT INTO coll_test (id, s) values (177, 'xs');
INSERT INTO coll_test (id, s) values (173, 'Xr');
INSERT INTO coll_test (id, s) values (169, 'xqx');
INSERT INTO coll_test (id, s) values (165, 'xq');
INSERT INTO coll_test (id, s) values (161, 'Xp');
INSERT INTO coll_test (id, s) values (157, 'xòx');
INSERT INTO coll_test (id, s) values (153, 'xox');
INSERT INTO coll_test (id, s) values (149, 'xò');
INSERT INTO coll_test (id, s) values (145, 'xó');
INSERT INTO coll_test (id, s) values (141, 'xo');
INSERT INTO coll_test (id, s) values (137, 'Xn');
INSERT INTO coll_test (id, s) values (133, 'xmx');
INSERT INTO coll_test (id, s) values (129, 'xm');
INSERT INTO coll_test (id, s) values (125, 'Xl');
INSERT INTO coll_test (id, s) values (121, 'xkx');
INSERT INTO coll_test (id, s) values (117, 'xk');
INSERT INTO coll_test (id, s) values (113, 'Xj');
INSERT INTO coll_test (id, s) values (109, 'xïx');
INSERT INTO coll_test (id, s) values (105, 'xíx');
INSERT INTO coll_test (id, s) values (101, 'Xï');
INSERT INTO coll_test (id, s) values (97, 'Xì');
INSERT INTO coll_test (id, s) values (93, 'Xí');
INSERT INTO coll_test (id, s) values (89, 'Xi');
INSERT INTO coll_test (id, s) values (85, 'xhx');
INSERT INTO coll_test (id, s) values (81, 'xh');
INSERT INTO coll_test (id, s) values (77, 'Xg');
INSERT INTO coll_test (id, s) values (73, 'xfx');
INSERT INTO coll_test (id, s) values (69, 'xf');
INSERT INTO coll_test (id, s) values (65, 'xéx');
INSERT INTO coll_test (id, s) values (61, 'Xè');
INSERT INTO coll_test (id, s) values (57, 'Xé');
INSERT INTO coll_test (id, s) values (53, 'Xe');
INSERT INTO coll_test (id, s) values (49, 'xdx');
INSERT INTO coll_test (id, s) values (45, 'xd');
INSERT INTO coll_test (id, s) values (41, 'Xc');
INSERT INTO coll_test (id, s) values (37, 'xbx');
INSERT INTO coll_test (id, s) values (33, 'xb');
INSERT INTO coll_test (id, s) values (29, 'xax');
INSERT INTO coll_test (id, s) values (25, 'Xæ');
INSERT INTO coll_test (id, s) values (21, 'Xà');
INSERT INTO coll_test (id, s) values (17, 'Xa');
INSERT INTO coll_test (id, s) values (13, 'X2');
INSERT INTO coll_test (id, s) values (9, 'x12');
INSERT INTO coll_test (id, s) values (5, 'x.x');
INSERT INTO coll_test (id, s) values (1, 'X');
INSERT INTO coll_test (id, s) values (234, 'XZ');
INSERT INTO coll_test (id, s) values (230, 'xYx');
INSERT INTO coll_test (id, s) values (226, 'xY');
INSERT INTO coll_test (id, s) values (222, 'XX');
INSERT INTO coll_test (id, s) values (218, 'xWx');
INSERT INTO coll_test (id, s) values (214, 'xW');
INSERT INTO coll_test (id, s) values (210, 'XV');
INSERT INTO coll_test (id, s) values (206, 'xÙx');
INSERT INTO coll_test (id, s) values (202, 'xUx');
INSERT INTO coll_test (id, s) values (198, 'xÙ');
INSERT INTO coll_test (id, s) values (194, 'xÚ');
INSERT INTO coll_test (id, s) values (190, 'xU');
INSERT INTO coll_test (id, s) values (186, 'XT');
INSERT INTO coll_test (id, s) values (182, 'xSx');
INSERT INTO coll_test (id, s) values (178, 'xS');
INSERT INTO coll_test (id, s) values (174, 'XR');
INSERT INTO coll_test (id, s) values (170, 'xQx');
INSERT INTO coll_test (id, s) values (166, 'xQ');
INSERT INTO coll_test (id, s) values (162, 'XP');
INSERT INTO coll_test (id, s) values (158, 'xÒx');
INSERT INTO coll_test (id, s) values (154, 'xOx');
INSERT INTO coll_test (id, s) values (150, 'xÒ');
INSERT INTO coll_test (id, s) values (146, 'xÓ');
INSERT INTO coll_test (id, s) values (142, 'xO');
INSERT INTO coll_test (id, s) values (138, 'XN');
INSERT INTO coll_test (id, s) values (134, 'xMx');
INSERT INTO coll_test (id, s) values (130, 'xM');
INSERT INTO coll_test (id, s) values (126, 'XL');
INSERT INTO coll_test (id, s) values (122, 'xKx');
INSERT INTO coll_test (id, s) values (118, 'xK');
INSERT INTO coll_test (id, s) values (114, 'XJ');
INSERT INTO coll_test (id, s) values (110, 'xÏx');
INSERT INTO coll_test (id, s) values (106, 'xÍx');
INSERT INTO coll_test (id, s) values (102, 'XÏ');
INSERT INTO coll_test (id, s) values (98, 'XÌ');
INSERT INTO coll_test (id, s) values (94, 'XÍ');
INSERT INTO coll_test (id, s) values (90, 'XI');
INSERT INTO coll_test (id, s) values (86, 'xHx');
INSERT INTO coll_test (id, s) values (82, 'xH');
INSERT INTO coll_test (id, s) values (78, 'XG');
INSERT INTO coll_test (id, s) values (74, 'xFx');
INSERT INTO coll_test (id, s) values (70, 'xF');
INSERT INTO coll_test (id, s) values (66, 'xÉx');
INSERT INTO coll_test (id, s) values (62, 'XÈ');
INSERT INTO coll_test (id, s) values (58, 'XÉ');
INSERT INTO coll_test (id, s) values (54, 'XE');
INSERT INTO coll_test (id, s) values (50, 'xDx');
INSERT INTO coll_test (id, s) values (46, 'xD');
INSERT INTO coll_test (id, s) values (42, 'XC');
INSERT INTO coll_test (id, s) values (38, 'xBx');
INSERT INTO coll_test (id, s) values (34, 'xB');
INSERT INTO coll_test (id, s) values (30, 'xAx');
INSERT INTO coll_test (id, s) values (26, 'XÆ');
INSERT INTO coll_test (id, s) values (22, 'XÀ');
INSERT INTO coll_test (id, s) values (18, 'XA');
INSERT INTO coll_test (id, s) values (14, 'x2x');
INSERT INTO coll_test (id, s) values (10, 'X12');
INSERT INTO coll_test (id, s) values (6, 'x0');
INSERT INTO coll_test (id, s) values (2, 'x x');
INSERT INTO coll_test (id, s) values (235, 'xzx');
INSERT INTO coll_test (id, s) values (231, 'xz');
INSERT INTO coll_test (id, s) values (227, 'Xy');
INSERT INTO coll_test (id, s) values (223, 'xxx');
INSERT INTO coll_test (id, s) values (219, 'xx');
INSERT INTO coll_test (id, s) values (215, 'Xw');
INSERT INTO coll_test (id, s) values (211, 'xvx');
INSERT INTO coll_test (id, s) values (207, 'xv');
INSERT INTO coll_test (id, s) values (203, 'xúx');
INSERT INTO coll_test (id, s) values (199, 'Xù');
INSERT INTO coll_test (id, s) values (195, 'Xú');
INSERT INTO coll_test (id, s) values (191, 'Xu');
INSERT INTO coll_test (id, s) values (187, 'xtx');
INSERT INTO coll_test (id, s) values (183, 'xt');
INSERT INTO coll_test (id, s) values (179, 'Xs');
INSERT INTO coll_test (id, s) values (175, 'xrx');
INSERT INTO coll_test (id, s) values (171, 'xr');
INSERT INTO coll_test (id, s) values (167, 'Xq');
INSERT INTO coll_test (id, s) values (163, 'xpx');
INSERT INTO coll_test (id, s) values (159, 'xp');
INSERT INTO coll_test (id, s) values (155, 'xóx');
INSERT INTO coll_test (id, s) values (151, 'Xò');
INSERT INTO coll_test (id, s) values (147, 'Xó');
INSERT INTO coll_test (id, s) values (143, 'Xo');
INSERT INTO coll_test (id, s) values (139, 'xnx');
INSERT INTO coll_test (id, s) values (135, 'xn');
INSERT INTO coll_test (id, s) values (131, 'Xm');
INSERT INTO coll_test (id, s) values (127, 'xlx');
INSERT INTO coll_test (id, s) values (123, 'xl');
INSERT INTO coll_test (id, s) values (119, 'Xk');
INSERT INTO coll_test (id, s) values (115, 'xjx');
INSERT INTO coll_test (id, s) values (111, 'xj');
INSERT INTO coll_test (id, s) values (107, 'xìx');
INSERT INTO coll_test (id, s) values (103, 'xix');
INSERT INTO coll_test (id, s) values (99, 'xï');
INSERT INTO coll_test (id, s) values (95, 'xì');
INSERT INTO coll_test (id, s) values (91, 'xí');
INSERT INTO coll_test (id, s) values (87, 'xi');
INSERT INTO coll_test (id, s) values (83, 'Xh');
INSERT INTO coll_test (id, s) values (79, 'xgx');
INSERT INTO coll_test (id, s) values (75, 'xg');
INSERT INTO coll_test (id, s) values (71, 'Xf');
INSERT INTO coll_test (id, s) values (67, 'xèx');
INSERT INTO coll_test (id, s) values (63, 'xex');
INSERT INTO coll_test (id, s) values (59, 'xè');
INSERT INTO coll_test (id, s) values (55, 'xé');
INSERT INTO coll_test (id, s) values (51, 'xe');
INSERT INTO coll_test (id, s) values (47, 'Xd');
INSERT INTO coll_test (id, s) values (43, 'xcx');
INSERT INTO coll_test (id, s) values (39, 'xc');
INSERT INTO coll_test (id, s) values (35, 'Xb');
INSERT INTO coll_test (id, s) values (31, 'xàx');
INSERT INTO coll_test (id, s) values (27, 'xæx');
INSERT INTO coll_test (id, s) values (23, 'xæ');
INSERT INTO coll_test (id, s) values (19, 'xà');
INSERT INTO coll_test (id, s) values (15, 'xa');
INSERT INTO coll_test (id, s) values (11, 'x12x');
INSERT INTO coll_test (id, s) values (7, 'X0');
INSERT INTO coll_test (id, s) values (3, 'x.');
INSERT INTO coll_test (id, s) values (236, 'xZx');
INSERT INTO coll_test (id, s) values (232, 'xZ');
INSERT INTO coll_test (id, s) values (228, 'XY');
INSERT INTO coll_test (id, s) values (224, 'xXx');
INSERT INTO coll_test (id, s) values (220, 'xX');
INSERT INTO coll_test (id, s) values (216, 'XW');
INSERT INTO coll_test (id, s) values (212, 'xVx');
INSERT INTO coll_test (id, s) values (208, 'xV');
INSERT INTO coll_test (id, s) values (204, 'xÚx');
INSERT INTO coll_test (id, s) values (200, 'XÙ');
INSERT INTO coll_test (id, s) values (196, 'XÚ');
INSERT INTO coll_test (id, s) values (192, 'XU');
INSERT INTO coll_test (id, s) values (188, 'xTx');
INSERT INTO coll_test (id, s) values (184, 'xT');
INSERT INTO coll_test (id, s) values (180, 'XS');
INSERT INTO coll_test (id, s) values (176, 'xRx');
INSERT INTO coll_test (id, s) values (172, 'xR');
INSERT INTO coll_test (id, s) values (168, 'XQ');
INSERT INTO coll_test (id, s) values (164, 'xPx');
INSERT INTO coll_test (id, s) values (160, 'xP');
INSERT INTO coll_test (id, s) values (156, 'xÓx');
INSERT INTO coll_test (id, s) values (152, 'XÒ');
INSERT INTO coll_test (id, s) values (148, 'XÓ');
INSERT INTO coll_test (id, s) values (144, 'XO');
INSERT INTO coll_test (id, s) values (140, 'xNx');
INSERT INTO coll_test (id, s) values (136, 'xN');
INSERT INTO coll_test (id, s) values (132, 'XM');
INSERT INTO coll_test (id, s) values (128, 'xLx');
INSERT INTO coll_test (id, s) values (124, 'xL');
INSERT INTO coll_test (id, s) values (120, 'XK');
INSERT INTO coll_test (id, s) values (116, 'xJx');
INSERT INTO coll_test (id, s) values (112, 'xJ');
INSERT INTO coll_test (id, s) values (108, 'xÌx');
INSERT INTO coll_test (id, s) values (104, 'xIx');
INSERT INTO coll_test (id, s) values (100, 'xÏ');
INSERT INTO coll_test (id, s) values (96, 'xÌ');
INSERT INTO coll_test (id, s) values (92, 'xÍ');
INSERT INTO coll_test (id, s) values (88, 'xI');
INSERT INTO coll_test (id, s) values (84, 'XH');
INSERT INTO coll_test (id, s) values (80, 'xGx');
INSERT INTO coll_test (id, s) values (76, 'xG');
INSERT INTO coll_test (id, s) values (72, 'XF');
INSERT INTO coll_test (id, s) values (68, 'xÈx');
INSERT INTO coll_test (id, s) values (64, 'xEx');
INSERT INTO coll_test (id, s) values (60, 'xÈ');
INSERT INTO coll_test (id, s) values (56, 'xÉ');
INSERT INTO coll_test (id, s) values (52, 'xE');
INSERT INTO coll_test (id, s) values (48, 'XD');
INSERT INTO coll_test (id, s) values (44, 'xCx');
INSERT INTO coll_test (id, s) values (40, 'xC');
INSERT INTO coll_test (id, s) values (36, 'XB');
INSERT INTO coll_test (id, s) values (32, 'xÀx');
INSERT INTO coll_test (id, s) values (28, 'xÆx');
INSERT INTO coll_test (id, s) values (24, 'xÆ');
INSERT INTO coll_test (id, s) values (20, 'xÀ');
INSERT INTO coll_test (id, s) values (16, 'xA');
INSERT INTO coll_test (id, s) values (12, 'x2');
INSERT INTO coll_test (id, s) values (8, 'x0x');
INSERT INTO coll_test (id, s) values (4, 'X.');

SELECT id, s FROM coll_test ORDER BY s;

DROP TABLE coll_test;
set names iso88591;
commit;
--+ holdcas off;
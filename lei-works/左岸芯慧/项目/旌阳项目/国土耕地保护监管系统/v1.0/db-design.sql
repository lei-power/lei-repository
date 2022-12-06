INSERT INTO [dbo].[TBL_SICHUAN_DEYANG_JINGYANG]([OBJECTID], [BSM], [YSDM], [DKBM], [DKMC], [SYQXZ], [DKLB], [TDLYLX],
    [DLDJ], [TDYT], [SFJBNT], [SCMJ], [DKDZ], [DKXZ], [DKNZ], [DKBZ],
    [DKBZXX], [ZJRXM], [KJZB], [SCMJM], [CBFBM], [CBFMC], [CBFZJHM],
    [land_type], [sn_land_flag], [sn_land_plant_flag], [shed_flag],
    [town_id], [town_name], [village_id], [village_name], [group_id],
    [group_name], [sn_farm_id], [sn_farm_name], [sn_legal_person],
    [sn_legal_person_phone], [LXDH], [Shape_STArea__], [Shape_STLength__],
[Shape])
VALUES (544716, 16814917, N'211011', N'5106031082100900795', N'王关兴的0.9', N'31', N'10', N'011', N' ', N'1', N' ', 610.61, N'土埂', N'周述坤王关兴的0.9', N'荒地', N'罗德珍高坎14号1.05', N' ', N'指界小组成员', N'T3100/T3135/T3137/T3139/T3141', .92, N'510603108210090096', N'张林金', N'510602194705100313', 2, 0, 0, NULL, N'1000097', N'德新镇', N'2000916', N'龙泉村', N'51060310821009', N'09组', NULL, NULL, NULL, NULL, N'', .00000006, .00096379, geometry::STGeomFromText('POLYGON ((104.366635584764481 31.222474265475, 104.366841731860518 31.222262417576587, 104.366868683642906 31.222293687903402, 104.366986616239387 31.222437451727046, 104.366987410340755 31.222443183106463, 104.36698259357189 31.222451648424908, 104.366827960542025 31.222582514171734, 104.366820813629715 31.222583501627355, 104.366810355413634 31.222581302784931, 104.366800748855553 31.222576244098434, 104.366635584764481 31.222474265475))', 0));


UPDATE [dbo].[TBL_SICHUAN_DEYANG_JINGYANG]
SET
    [Shape_STArea__] = .00004073, [Shape_STLength__] = .00080136, [Shape] = geometry::STGeomFromText('POLYGON ((104.366635584764481 31.222474265475, 104.366841731860518 31.222262417576587, 104.366868683642906 31.222293687903402, 104.366986616239387 31.222437451727046, 104.366987410340755 31.222443183106463, 104.36698259357189 31.222451648424908, 104.366827960542025 31.222582514171734, 104.366820813629715 31.222583501627355, 104.366810355413634 31.222581302784931, 104.366800748855553 31.222576244098434, 104.366635584764481 31.222474265475))', 0)
WHERE [OBJECTID] = 544715;

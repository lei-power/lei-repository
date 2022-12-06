#### 浦东定时任务

1 .堡垒机地址
https://116.228.18.37/
账户lihaifeng 密码851127
登录的时候选择“短信口令”方式登录

登陆后点击右上角账户→工具下载→单点登录器安装 然后在左侧运维就可以看懂服务器了

2 .堡垒机信息
系统 说明 服务器 ip 账号 密码 网段
农业生产管理系统（神农口袋） 数据服务 snkd1 192.168.25.188 snkd 1qazXSW@ 互联网
农业生产管理系统（神农口袋） 数据服务 snkd2 192.168.26.188 snkd 1qazXSW@ 政府外网

### 任务列表

#### 浦东定时器.kjb

开始时间 03:00:00
目标：本地数据库 frp_pdzzsys
源：浦东数据库 pdZzSys

1. 浦东数据从sqlserver同步到mysql
   t_company t_farm t_plan t_plot t_reap t_sale

2. 浦东数据从sqlserver同步到mysql
   t_district t_muck t_pesticide t_plot_convert t_product

3. sqlServer_pudong_statistics_task.py
   db = pymysql.connect("localhost", "root", "1qazXSW@", **"frp_statistics"**, charset='utf8')
   connect = pymssql.connect('10.81.71.66', 'ZAHX_user', 'AsDF.123@ZX', **'pdZzSys'**)

#### 时间戳任务定时器1和2任务.kjb

开始时间 06:01:01 开始项[时间戳任务1]
开始时间 06:01:10 开始项[时间戳任务2]
bas_company
bas_farm
bas_muck
bas_pesticide
bas_plot
bas_product
bas_troop
sc_farm
sc_farm_add_tmp
sc_farm_change_tmp
sc_farm_del_tmp
sc_fert
sc_flooding
sc_otherfarm
sc_plan
sc_reap
sc_selldir
sc_usepest

#### 时间戳任务定时器3和4任务.kjb

开始时间 06:21:23 开始项[时间戳任务3]
开始时间 06:27:20 开始项[时间戳任务4]

#### 定时器2任务.kjb

开始时间 06:41:00 开始项[2]

#### 市级、浦东、神农口袋定时器.kjb

目标：本地数据库 frp_gxsjj
源：浦东数据库 gxsjj
开始时间 20:00:00 开始项[]
bas_sc_company_info

#### 任务定时器.kjb

开始时间 23:00:00 开始项[]
目标：本地数据库 frp_zhifa
源：浦东数据库 dbo...
ba_company 全量更新
jg_patrol_record 全量更新
jg_record_detail 全量更新
jg_template 全量更新
jg_template_detail 全量更新

#### 执法2.0版本定时器.kjb

开始时间 23:10:00 开始项[执法2.0]
目标：本地数据库 frp_zhifa
源：浦东数据库 dbo...
area 全量更新
ba_inspection 全量更新
ba_user_company 全量更新






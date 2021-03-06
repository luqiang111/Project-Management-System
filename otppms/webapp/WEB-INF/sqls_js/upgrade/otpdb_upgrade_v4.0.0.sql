-- upgrade sql version
update otppms_configinfo set confvalue='4.2.0' where confname='sqlsversion' and conftype='common';

-- insert otppms_configinfo
-- data bak
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('log_is_bak', 'common', '0', 0, '');

-- user
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('auth_otp_when_bind', 'user', '1', 0, '0-not need,1-require,2-optional');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('default_localauth', 'user', '0', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('default_backendauth', 'user', '0', 0, '');

-- peap
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('enabled_peap', 'auth', 'n', 0, 'y/n');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('locked_peap', 'auth', 'y', 0, 'y/n');

-- insert radius request send smsotp password
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('sms_token_req_more_attr','token', 'State', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('sms_token_req_more_attr_val', 'token','get', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('sms_token_req_send_before_check', 'token','1', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('sms_token_req_return_code_domain', 'token','11', 0, '');

-- db bak config
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('is_time_auto', 'bak', '0', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('is_bak_Log', 'bak', '0', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('is_remote', 'bak', '0', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('dir', 'bak', '0', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('temp_dir', 'bak', '0', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('server_ip', 'bak', '0', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('port', 'bak', '0', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('user', 'bak', '0', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('password', 'bak', '0', 0, '');

-- portal
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('init_pwd_login_verify_type', 'portal', '1', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('init_pwd_email_active_expire', 'portal', '1', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('init_pwd_sms_verify_expire', 'portal', '15', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('ad_verify_pwd_ip', 'portal', '127.0.0.1', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('ad_verify_pwd_port', 'portal', '389', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('ad_verify_pwd_dn', 'portal', 'www.sample.com', 0, '');

insert into otppms_perminfo(permcode, permlink,srcname,keymark, descp) values('050503', '/manager/confinfo/config/portal!find.action', '','', '');
insert into otppms_role_perm(roleid,permcode)values(1,'050503');

insert into otppms_perminfo(permcode, permlink,srcname,keymark, descp) values('050103', '/manager/confinfo/config/authConfAction!modify.action?oper=initpeap', '','', '');
insert into otppms_role_perm(roleid,permcode)values(1,'050103');

-- upgrade adminperm --------------------------------------------------------
-- home
update otppms_perminfo set permlink ='/manager/lic/license!find.action' where permcode = '000001';
-- admin

-- admin user
update otppms_perminfo set srcname ='<img src="<%=path%>/images/icon/error_go.png" width="16" height="16" hspace="2"  border="0">' where permcode = '010105';
update otppms_perminfo set srcname ='<img src="<%=path%>/images/icon/key_go.png" width="16" height="16" hspace="2"  border="0">' where permcode = '010107';

-- admin role

-- User

-- user info
update otppms_perminfo set permlink ='/manager/user/userinfo/userInfo!init.action' where permcode ='0200';
update otppms_perminfo set permlink ='/manager/user/userinfo/userInfo!batchOper.action?oper=0' where permcode='020103';
update otppms_perminfo set permlink ='/manager/user/userinfo/userInfo!unBindUT.action,/manager/user/userinfo/userInfo!batchOper.action?oper=1' where permcode='020105';
update otppms_perminfo set permlink ='/manager/user/userinfo/userInfo!bindChangeTkn.action' where permcode ='020106';
update otppms_perminfo set permlink ='/manager/user/userinfo/userInfo!editUserLost.action,/manager/user/userinfo/userInfo!batchOper.action?oper=3,/manager/user/userinfo/userInfo!batchOper.action?oper=4' where permcode ='020108';
update otppms_perminfo set permlink ='/manager/user/userinfo/userInfo!editUserEnabled.action,/manager/user/userinfo/userInfo!batchOper.action?oper=5,/manager/user/userinfo/userInfo!batchOper.action?oper=6' where permcode ='020109';
update otppms_perminfo set permlink ='/manager/user/userinfo/userInfo!batchOper.action?oper=2' where permcode ='020110';
update otppms_perminfo set permlink ='/manager/user/userinfo/userChange!changeUser.action' where permcode ='020111';
update otppms_perminfo set permlink ='/manager/user/userinfo/userInfo!batchOper.action?oper=7' where permcode ='020112';
update otppms_perminfo set permlink ='/manager/user/userinfo/userInfo!batchOper.action?oper=8' where permcode ='020113';

-- token info
update otppms_perminfo set permlink = '/manager/token/token!init.action' where permcode ='0300';
update otppms_perminfo set permlink = '/manager/token/token!modifyBatch.action?oper=0,/manager/token/token!modifyBatch.action?oper=1,/manager/token/token!modify.action?operType=1',srcname='<img src="<%=path%>/images/icon/error_go.png" width="16" height="16" hspace="2"   border="0">' where permcode ='030101';
update otppms_perminfo set permlink = '/manager/token/token!modifyBatch.action?oper=2,/manager/token/token!modifyBatch.action?oper=3,/manager/token/token!modify.action?operType=3' where permcode ='030102';
update otppms_perminfo set permlink = '/manager/token/token!modifyBatch.action?oper=4,/manager/token/token!modifyBatch.action?oper=5,/manager/token/token!modify.action?operType=2' where permcode ='030103';
update otppms_perminfo set permlink = '/manager/token/token!modifyBatch.action?oper=6,/manager/token/token!modify.action?operType=4&sign=0' where permcode ='030104';
update otppms_perminfo set permlink = '/manager/token/token!modifyBatch.action?oper=8,/manager/token/token!modify.action?operType=4&sign=1' where permcode ='030105';
update otppms_perminfo set permlink = '/manager/token/authAction!tokenAuth.action' where permcode ='030106';
update otppms_perminfo set permlink = '/manager/token/authAction!tokenSync.action' where permcode ='030107';
update otppms_perminfo set permlink = '/manager/token/token!modifyBatch.action?oper=9' where permcode ='030109';
update otppms_perminfo set srcname ='<img src="<%=path%>/images/icon/label_edit.gif" width="16" height="16" hspace="2"  border="0">' where permcode = '030110';
update otppms_perminfo set srcname ='<img src="<%=path%>/images/icon/link_go.png" width="16" height="16" hspace="2"  border="0">' where permcode = '030112';
update otppms_perminfo set srcname ='<img src="<%=path%>/images/icon/link_break.png" width="16" height="16" hspace="2"  border="0">' where permcode = '030113';

-- token dist
update otppms_perminfo set permlink = '/manager/token/distmanager/distManager!init.action' where permcode ='0304';
update otppms_perminfo set permlink = '/manager/token/distmanager/distManager!onLineDistribute.action,/manager/token/distmanager/distManager!offLineActivate.action' where permcode ='030402';
update otppms_perminfo set permlink = '/manager/token/distmanager/distManager!modify.action?oper=1' where permcode ='030403';

-- Auth Manager

-- server

-- agent
update otppms_perminfo set srcname ='<img src="<%=path%>/images/icon/drive_delete.png" width="16" height="16" hspace="2"   border="0">' where permcode = '040106';
update otppms_perminfo set permlink = '/manager/authmgr/server/authAgent!selServer.action',srcname ='<img src="<%=path%>/images/icon/drive_add.png" width="16" height="16" hspace="2"   border="0">' where permcode ='040108';

-- backend
update otppms_perminfo set srcname ='<img src="<%=path%>/images/icon/error_go.png" width="16" height="16" hspace="2"  border="0">' where permcode ='040205';

-- agentConf

-- config

-- sys common config
update otppms_perminfo set permlink = '/logout!logout.action' where permcode ='050001';

-- auth config
update otppms_perminfo set permlink = '/manager/confinfo/config/authConfAction!modify.action?oper=initconf' where permcode ='050101';

-- user config
update otppms_perminfo set permlink = '/manager/confinfo/config/userConfAction!modify.action?oper=utknconf' where permcode ='050201';
update otppms_perminfo set permlink = '/manager/confinfo/config/userConfAction!modify.action?oper=upwdconf' where permcode ='050202';

-- token config
update otppms_perminfo set permlink = '/manager/confinfo/config/tokenConfAction!modify.action?oper=softtkn' where permcode ='050301';
update otppms_perminfo set permlink = '/manager/confinfo/config/tokenConfAction!modify.action?oper=mobiletkn' where permcode ='050302';
update otppms_perminfo set permlink = '/manager/confinfo/config/tokenConfAction!modify.action?oper=smstkn' where permcode ='050303';
update otppms_perminfo set permlink = '/manager/confinfo/config/tokenConfAction!modify.action?oper=emeypin' where permcode ='050304';

-- center config
update otppms_perminfo set permlink = '/manager/confinfo/config/center!modify.action?oper=adminconf' where permcode ='050401';
update otppms_perminfo set permlink = '/manager/confinfo/config/center!modify.action?oper=trustip,/manager/confinfo/config/access!add.action' where permcode ='050402';
update otppms_perminfo set permlink = '/manager/confinfo/config/center!modify.action?oper=authser' where permcode ='050403';

-- protal config

-- Log

-- log admin

-- log user

-- Report

-- report operation

-- report user

-- report token

-- orgunit domain

-- orgunit unit

-- otppms_agentinfo
update otppms_agentinfo set agentname=agentipaddr;


-- heartbeat warn
insert into otppms_perminfo(permcode, permlink,srcname,keymark, descp) values('050602', '/manager/confinfo/config/monitorconfig!find.action', '','', '');
insert into otppms_role_perm(roleid,permcode)values(1,'050602');

insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('enabled', 'warn_heart_beat', '0', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('main_ip', 'warn_heart_beat', ' ', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('spare_ip', 'warn_heart_beat', ' ', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('adminid', 'warn_heart_beat', ' ', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('time_interval', 'warn_heart_beat', '60', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('send_type', 'warn_heart_beat', ' ', 0, '');
insert into otppms_configinfo (confname, conftype, confvalue, parentid, descp) values ('port', 'warn_heart_beat', ' ', 0, '');

/*
创建存储过程
获取牛只上一天的该时间的平均步数
*/
DROP PROCEDURE IF EXISTS `SP_OF_TR_GET_PJBS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OF_TR_get_pjbs`(IN vncbh varchar(100),
    IN vjbbh varchar(100),
    IN vnzbh varchar(100),
    IN vjbrq varchar(100),
    IN vjbsd varchar(10),
		OUT vscpjbs int(11))
    SQL SECURITY INVOKER
BEGIN
	DECLARE sqlstr varchar(2000);
	#拼接SQL语句

	#SET sqlstr = concat('select pjbs',jbsd,' into scpjbs from fqydsjxx where ncbh = ',ncbh,' and jbqbh = ',jbbh,' and nzbh =',nzbh,' and date_format(jlrq,"%Y-%m-%d") < ',jbrq,' order by jlrq desc limit 1');
	#SET @sql = sqlstr;
	#PREPARE presql FROM @sql;
	#EXECUTE sqlstr;
	#DEALLOCATE PREPARE presql;
	CASE vjbsd
		WHEN '0' THEN
			select pjbs0 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '1' THEN
			select pjbs1 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '2' THEN
			select pjbs2 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '3' THEN
			select pjbs3 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '4' THEN
			select pjbs4 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '5' THEN
			select pjbs5 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '6' THEN
			select pjbs6 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '7' THEN
			select pjbs7 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '8' THEN
			select pjbs8 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '9' THEN
			select pjbs9 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '10' THEN
			select pjbs10 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '11' THEN
			select pjbs11 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '12' THEN
			select pjbs12 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '13' THEN
			select pjbs13 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '14' THEN
			select pjbs14 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '15' THEN
			select pjbs15 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '16' THEN
			select pjbs16 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '17' THEN
			select pjbs17 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '18' THEN
			select pjbs18 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '19' THEN
			select pjbs19 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '20' THEN
			select pjbs20 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '21' THEN
			select pjbs21 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '22' THEN
			select pjbs22 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		WHEN '23' THEN
			select pjbs23 into vscpjbs from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh =vnzbh and date_format(jlrq,"%Y-%m-%d") < vjbrq order by jlrq desc limit 1;
		END CASE;	
END
;;
DELIMITER ;

/*
创建存储过程
新增或更新发情运动数据信息表（fqydsjxx）
*/
DROP PROCEDURE IF EXISTS `SP_OF_TR_INS_YDSJ`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OF_TR_ins_ydsj`(IN vncbh varchar(100),
    IN vjbbh varchar(100),
    IN vnzbh varchar(100),
    IN vjbrq varchar(100),
    IN vjbsd varchar(100),
		IN vnzbs int(11),
		IN vpjbs int(11))
BEGIN
	DECLARE vsql varchar(1000);
	#拼接SQL语句
	#判断是否存在记录
	set @fqid = (select xh from fqydsjxx where ncbh = vncbh and jbqbh = vjbbh and nzbh = vnzbh and date_format(jlrq,"%Y-%m-%d") = vjbrq limit 1);
	#if @fqid = null then
	#	set vsql = concat("insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs",vjbsd," pjbs",vjbsd,") values(uuid(),'",vncbh,"','",vjbbh,"','",vnzbh,"','",vjbrq,"',",vnzbs,vpjbs,")");
	#else
	#	set vsql = concat("update fqydsjxx set jlbs",vjbsd,"=",vnzbs,",pjbs",vjbsd,"=",vpjbs," where xh =",@fqid);
	#end if;
	#执行sql语句
	#SET @sql = vsql;
	#PREPARE presql FROM @sql;
	#EXECUTE presql;
	#DEALLOCATE PREPARE presql;
	#IF @fqid is null THEN
	IF ISNULL(@fqid) THEN
		CASE vjbsd
			WHEN '0' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs0, pjbs0) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '1' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs1, pjbs1) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '2' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs2, pjbs2) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '3' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs3, pjbs3) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '4' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs4, pjbs4) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '5' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs5, pjbs5) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '6' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs6, pjbs6) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '7' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs7, pjbs7) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '8' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs8, pjbs8) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '9' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs9, pjbs9) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '10' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs10, pjbs10) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '11' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs11, pjbs11) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '12' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs12, pjbs12) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '13' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs13, pjbs13) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '14' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs14, pjbs14) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '15' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs15, pjbs15) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '16' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs16, pjbs16) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '17' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs17, pjbs17) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '18' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs18, pjbs18) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '19' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs19, pjbs19) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '20' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs20, pjbs20) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '21' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs21, pjbs21) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '22' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs22, pjbs22) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			WHEN '23' THEN
				insert into fqydsjxx (xh, ncbh, jbqbh, nzbh, jlrq, jlbs23, pjbs23) values(uuid(),vncbh,vjbbh,vnzbh,vjbrq,vnzbs,vpjbs);
			END CASE;
	ELSE
		CASE vjbsd
			WHEN '0' THEN
				update fqydsjxx set jlbs0=vnzbs, pjbs0=vpjbs where xh =@fqid;
			WHEN '1' THEN
				update fqydsjxx set jlbs1=vnzbs, pjbs1=vpjbs where xh =@fqid;
			WHEN '2' THEN
				update fqydsjxx set jlbs2=vnzbs, pjbs2=vpjbs where xh =@fqid;
			WHEN '3' THEN
				update fqydsjxx set jlbs3=vnzbs, pjbs3=vpjbs where xh =@fqid;
			WHEN '4' THEN
				update fqydsjxx set jlbs4=vnzbs, pjbs4=vpjbs where xh =@fqid;
			WHEN '5' THEN
				update fqydsjxx set jlbs5=vnzbs, pjbs5=vpjbs where xh =@fqid;
			WHEN '6' THEN
				update fqydsjxx set jlbs6=vnzbs, pjbs6=vpjbs where xh =@fqid;
			WHEN '7' THEN
				update fqydsjxx set jlbs7=vnzbs, pjbs7=vpjbs where xh =@fqid;
			WHEN '8' THEN
				update fqydsjxx set jlbs8=vnzbs, pjbs8=vpjbs where xh =@fqid;
			WHEN '9' THEN
				update fqydsjxx set jlbs9=vnzbs, pjbs9=vpjbs where xh =@fqid;
			WHEN '10' THEN
				update fqydsjxx set jlbs10=vnzbs, pjbs10=vpjbs where xh =@fqid;
			WHEN '11' THEN
				update fqydsjxx set jlbs11=vnzbs, pjbs11=vpjbs where xh =@fqid;
			WHEN '12' THEN
				update fqydsjxx set jlbs12=vnzbs, pjbs12=vpjbs where xh =@fqid;
			WHEN '13' THEN
				update fqydsjxx set jlbs13=vnzbs, pjbs13=vpjbs where xh =@fqid;
			WHEN '14' THEN
				update fqydsjxx set jlbs14=vnzbs, pjbs14=vpjbs where xh =@fqid;
			WHEN '15' THEN
				update fqydsjxx set jlbs15=vnzbs, pjbs15=vpjbs where xh =@fqid;
			WHEN '16' THEN
				update fqydsjxx set jlbs16=vnzbs, pjbs16=vpjbs where xh =@fqid;
			WHEN '17' THEN
				update fqydsjxx set jlbs17=vnzbs, pjbs17=vpjbs where xh =@fqid;
			WHEN '18' THEN
				update fqydsjxx set jlbs18=vnzbs, pjbs18=vpjbs where xh =@fqid;
			WHEN '19' THEN
				update fqydsjxx set jlbs19=vnzbs, pjbs19=vpjbs where xh =@fqid;
			WHEN '20' THEN
				update fqydsjxx set jlbs20=vnzbs, pjbs20=vpjbs where xh =@fqid;
			WHEN '21' THEN
				update fqydsjxx set jlbs21=vnzbs, pjbs21=vpjbs where xh =@fqid;
			WHEN '22' THEN
				update fqydsjxx set jlbs22=vnzbs, pjbs22=vpjbs where xh =@fqid;
			WHEN '23' THEN
				update fqydsjxx set jlbs23=vnzbs, pjbs23=vpjbs where xh =@fqid;
			END CASE;
		#set vsql = concat("update fqydsjxx set jlbs",vjbsd,"=",vnzbs,",pjbs",vjbsd,"=",vpjbs," where xh =",@fqid);
	end if;
END
;;
DELIMITER ;
/*
创建存储过程
新增发情提示信息表（fqtsxx）
*/
DROP PROCEDURE IF EXISTS `SP_OF_TR_INS_YDTS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OF_TR_ins_ydts`(IN vncbh varchar(100),
	IN vjbbh varchar(100),
	IN vnzbh varchar(100),
	IN vjbrq varchar(100),
	IN vjbsj varchar(100),
	IN vtslx varchar(100),
	IN vtsms varchar(100))
BEGIN
	#1、检查是否已经提示，当天有提示，则不再提示
	set @sfts = (select xh from fqtsxx where ncbh = vncbh and jbqbh = vjbbh and nzbh = vnzbh and date_format(tssj,"%Y-%m-%d") = vjbrq);
  if ISNULL(@sfts) then
		#2、增加数据到fqtsxx表
		insert into fqtsxx(xh, jbqbh, ncbh, nzbh, tssj, tslx, tsms) values (uuid(),vjbbh, vncbh, vnzbh, vjbsj, vtslx, vtsms);
		#3、增加数据到tsxxb表
		#查询提示电话号码
		set @tsdh = (select pzydh from ncjbxxb where xh = vncbh);
		insert into tsxxb(xh, ncbh, sjhm, tslx, tsnr) values (uuid(), vncbh, @tsdh, vtslx, vtsms);
  end if;
END
;;
DELIMITER ;
/*
创建发情数据分析触发器
*/
DROP TRIGGER IF EXISTS `TG_INSERT_FQJBXX`;
DELIMITER ;;
CREATE TRIGGER `TG_INSERT_FQJBXX` AFTER INSERT ON `fqjbxx` FOR EACH ROW
BEGIN
	#1、获取牛场编号、计步器编号、计步日期、时间、步数
	set @ncbh = (select xh from ncjbxxb where ncbh =new.ncbh);
              #set @ncbh = new.ncbh;
	set @jbbh = new.jbqbh;
	set @jbrq = (select date_format(new.kssj,'%Y-%m-%d'));
	set @jbsd = (select date_format(new.kssj,'%k'));
	set @jbsj = (select  date_format(new.kssj,'%Y-%m-%d %H:%i:%s'));
	set @nzbs = new.ljxx;
	set @fqyz = 2;
	set @jbyz = 0.5;
	#2、根据牛场编号、计步器编号，获取牛只编号
	set @nzxh = (select nzbh from jbqxx where ncbh = @ncbh and jbqbh = @jbbh);
    #set @nzxh = new.jbqbh;
	#3、根据牛只信息，拼接SQL语句获取到以有的该时段的平均值。
	call SP_OF_TR_get_pjbs(@ncbh, @jbbh, @nzxh, @jbrq, @jbsd, @scpjbs);
	#4、比较以前平均步数和本次步数的比例
	if isnull(@scpjbs) then 
	  #4.1:以前平均步数为空，则不做比较，赋值本次平均值。
	  set @pjbs = @nzbs;
	else 
	  #4.2:比较平均步数和本次步数
	  if @nzbs/@scpjbs > @fqyz then
	  #4.2.1:达到发情阈值，则记录发情提醒及短信提醒，不再赋值本次平均步数。
        set @nzbh = (select nzbh from nzjbxx where xh = @nzxh);
        set @jsmc = (select jsmc from jsxxb where xh =(select js from nzjbxx where xh = @nzxh));
		set @pjbs = @scpjbs;
		set @tslx = '发情提示';
		set @tsnr = concat('【发情提示】牛舍:',@jsmc,' 牛号:',@nzbh,' 牛只可能发情,请检查确认.提示时间:',@jbsj);
		call SP_OF_TR_ins_ydts(@ncbh, @jbbh, @nzxh, @jbrq, @jbsj, @tslx, @tsnr);
	  elseif @nzbs/@scpjbs < @jbyz then
	  #4.2.2达到疾病阈值，则记录疾病提醒及短信提醒
        set @nzbh = (select nzbh from nzjbxx where xh = @nzxh);
        set @jsmc = (select jsmc from jsxxb where xh =(select js from nzjbxx where xh = @nzxh));
		set @pjbs = @scpjbs;
		set @tslx = '运动量下降提示';
		set @tsnr = concat('【运动量下降提示】牛舍:',@jsmc,' 牛号:',@nzbh,' 牛只运动量下降,请检查确认.提示时间:',@jbsj);
		call SP_OF_TR_ins_ydts(@ncbh, @jbbh, @nzxh, @jbrq, @jbsj, @tslx, @tsnr);
	  else 
		set @pjbs = round((@scpjbs*7 + @nzbs)/8) ;
	  end if;
	end if;
	#5、  插入fqjbsjxx表一条新记录。根据牛只编号和计步日期获取fqjbsjxx表中是否有该天记录，没有则创建。有则更新该小时字段数据。
	call SP_OF_TR_ins_ydsj(@ncbh, @jbbh, @nzxh, @jbrq, @jbsd, @nzbs, @pjbs);
end;
;;
DELIMITER ;

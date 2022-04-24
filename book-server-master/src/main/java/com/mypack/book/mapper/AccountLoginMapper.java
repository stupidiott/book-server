package com.mypack.book.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mypack.book.dto.account.login.AccountLoginDTO;
import com.mypack.book.entity.EduAccountLogin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountLoginMapper extends BaseMapper<EduAccountLogin> {


    AccountLoginDTO queryAccountByToken(@Param("token") String token);


}

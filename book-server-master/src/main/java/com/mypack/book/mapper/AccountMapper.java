package com.mypack.book.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mypack.book.dto.account.AccountDTO;
import com.mypack.book.dto.account.AccountSearchDTO;
import com.mypack.book.entity.EduAccount;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountMapper extends BaseMapper<EduAccount> {

    AccountDTO queryByUsername(@Param("username") String username);

    List<AccountDTO> listAccount(AccountSearchDTO searchDTO);

}

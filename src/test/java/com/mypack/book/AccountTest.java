package com.mypack.book;

import com.alibaba.fastjson.JSON;
import com.mypack.book.dto.account.AccountDTO;
import com.mypack.book.dto.account.AccountSearchDTO;
import com.mypack.book.exception.UsernameExistException;
import com.mypack.book.service.account.AccountService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class AccountTest {

    @Autowired
    private AccountService accountService;

    @Test
    public void testAdd() {

        AccountDTO accountDTO = new AccountDTO();
        accountDTO.setUsername("test");
        accountDTO.setPassword("123456");

        try {
            accountService.add(accountDTO);
        } catch (UsernameExistException e) {
            e.printStackTrace();
        }
        System.out.println("添加成功...");
    }

    @Test
    public void testList() {

        AccountSearchDTO searchDTO = new AccountSearchDTO();
        searchDTO.setStatus(1);

        List<AccountDTO> accountDTOList = accountService.listAccount(searchDTO, true);

        System.out.println(JSON.toJSONString(accountDTOList));

    }

}

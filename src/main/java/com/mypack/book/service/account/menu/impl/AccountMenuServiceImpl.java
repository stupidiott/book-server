package com.mypack.book.service.account.menu.impl;

import com.mypack.book.entity.EduAccountMenu;
import com.mypack.book.mapper.AccountMenuMapper;
import com.mypack.book.service.account.menu.AccountMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AccountMenuServiceImpl implements AccountMenuService {

    @Autowired
    private AccountMenuMapper accountMenuMapper;

    @Override
    public String queryAccountMenu(Integer accountType) {

        if (accountType == null) {
            return null;
        }

        EduAccountMenu eduAccountMenu = accountMenuMapper.selectById(accountType);
        return eduAccountMenu.getMenu();
    }
}

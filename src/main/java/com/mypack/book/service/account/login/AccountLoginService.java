package com.mypack.book.service.account.login;

import com.mypack.book.dto.account.AccountDTO;

public interface AccountLoginService {

    AccountDTO queryAccountByToken(String token);

}

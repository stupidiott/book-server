package com.mypack.book.dto.account;

import com.mypack.book.dto.PageForm;
import lombok.Data;

@Data
public class AccountSearchDTO extends PageForm {

    private String username;
    private Integer status;

}

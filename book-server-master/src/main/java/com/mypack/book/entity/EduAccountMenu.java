package com.mypack.book.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "edu_account_menu")
public class EduAccountMenu {

    @TableId(value = "account_type")
    private Integer accountType;
    private String menu;

}

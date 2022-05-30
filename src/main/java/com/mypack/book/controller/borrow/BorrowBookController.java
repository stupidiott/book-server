package com.mypack.book.controller.borrow;

import com.github.pagehelper.PageInfo;
import com.mypack.book.constants.EnumDeleteFlag;
import com.mypack.book.dto.borrow.BorrowBookDTO;
import com.mypack.book.dto.borrow.BorrowBookSearchDTO;
import com.mypack.book.service.borrow.BorrowBookService;
import com.mypack.book.utils.Result;
import com.mypack.book.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/borrow/book")
public class BorrowBookController {

    @Autowired
    private BorrowBookService borrowBookService;

    @RequestMapping("/list")
    public Result list(@RequestBody BorrowBookSearchDTO searchDTO) {


        if(searchDTO.getDeleteFlag() == null){
            // 默认只显示未删除的。
            searchDTO.setDeleteFlag(EnumDeleteFlag.NO.getCode());
        }

        List<BorrowBookDTO> list = borrowBookService.list(searchDTO, true);
        return ResultUtils.success(new PageInfo<>(list));

    }

    @RequestMapping("/add")
    public Result add(@RequestBody BorrowBookDTO borrowBookDTO) {

        borrowBookDTO.setId(null);

        borrowBookService.add(borrowBookDTO);

        return ResultUtils.success();

    }

    @RequestMapping("/update")
    public Result lost(@RequestBody BorrowBookDTO bookDTO){
        borrowBookService.update(bookDTO);
        return ResultUtils.success();
    }
}

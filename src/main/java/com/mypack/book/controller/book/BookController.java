package com.mypack.book.controller.book;

import com.github.pagehelper.PageInfo;
import com.mypack.book.constants.EnumResponse;
import com.mypack.book.dto.book.BookDTO;
import com.mypack.book.dto.book.BookSearchDTO;
import com.mypack.book.dto.borrow.BorrowBookDTO;
import com.mypack.book.dto.borrow.BorrowBookSearchDTO;
import com.mypack.book.exception.BookNoExistException;
import com.mypack.book.service.book.BookService;
import com.mypack.book.service.borrow.BorrowBookService;
import com.mypack.book.utils.Result;
import com.mypack.book.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private BorrowBookService borrowBookService;

    @RequestMapping("/list")
    public Result list(@RequestBody BookSearchDTO searchDTO) {

        List<BookDTO> list = bookService.list(searchDTO, true);

        return ResultUtils.success(new PageInfo<>(list));

    }

    @RequestMapping("/add")
    public Result add(@RequestBody BookDTO bookDTO) {

        bookDTO.setId(null);

        try {
            bookService.insert(bookDTO);
            bookService.insertCopy(bookDTO);
        } catch (BookNoExistException e) {
            return ResultUtils.fail(e.getEnumResponse());
        }

        return ResultUtils.success();

    }

    @RequestMapping("/update")
    public Result update(@RequestBody BookDTO bookDTO) {

        if (bookDTO.getId() == null) {
            return ResultUtils.fail(EnumResponse.INVALID_PARAM);
        }
        if (bookDTO.getDeleteFlag() == 1){
            List<BorrowBookDTO> list = borrowBookService.list(new BorrowBookSearchDTO(),true);
            for (BorrowBookDTO borrowBookDTO : list) {
                if (Objects.equals(borrowBookDTO.getBookNo(), bookDTO.getBookNo())){
                    return ResultUtils.fail(EnumResponse.BOOK_BORROWED);
                }
            }
        }
        bookService.update(bookDTO);

        return ResultUtils.success();

    }
}

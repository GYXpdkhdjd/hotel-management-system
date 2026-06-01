package com.itmk.exception;


import com.itmk.utils.BusinessException;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author java实战基地
 * @Version 2383404558
 */

@ControllerAdvice
public class GlobalExceptionHandler {
     /**
     * 自定义业务异常拦截
     * BusinessException
     */
    @ExceptionHandler(BusinessException.class)
    @ResponseBody
    public ResultVo bussinessexception(BusinessException e) {

        return ResultUtils.error(e.getMessage(),e.getCode(),e.getMessage());
    }
}

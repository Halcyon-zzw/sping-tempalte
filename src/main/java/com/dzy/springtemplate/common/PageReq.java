package com.dzy.springtemplate.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.v3.oas.annotations.media.Schema;

import java.util.Optional;

/**
 * 分页请求
 *
 * @author zhuzhiwei
 * @date 2025/12/18 14:16
 */
public class PageReq {
    @Schema(description = "当前第几页，默认1页开始")
    private Integer pageNum;

    @Schema(description = "每页数量")
    private Integer pageSize;

    public <T> Page<T> convertToPage() {
        Page<T> tPage = new Page<>();
        tPage.setCurrent(Optional.ofNullable(pageNum).orElse(1));
        tPage.setSize(Optional.ofNullable(pageSize).orElse(20));
        return tPage;
    }
}

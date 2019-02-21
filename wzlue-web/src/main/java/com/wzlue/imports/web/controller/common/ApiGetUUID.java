package com.wzlue.imports.web.controller.common;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/api/uuid")
public class ApiGetUUID {
    /**
     * 获取guid
     * @return
     */
    @GetMapping("/getUUID")
    public String getUUID(){
        return UUID.randomUUID().toString().toUpperCase();
    }
}

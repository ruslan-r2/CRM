package ru.javateam.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
class NewsController {
    @GetMapping("/news")
    String order() {
        return "news";
    }
}


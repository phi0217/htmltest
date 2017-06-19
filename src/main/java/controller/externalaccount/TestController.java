package controller.externalaccount;

import dto.TestUserDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by Phi on 2017/6/18.
 */
@Controller
public class TestController {
    @RequestMapping(value = "/formListTest")
    public String formListTest(TestUserDto testUserDto) {
        System.out.println();
        return "test";
    }
}

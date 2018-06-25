package com.example.exam;

import com.example.exam.Controller.AccountController;
import com.example.exam.Interceptor.SessionInterceptor;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ExamApplicationTests {

    private MockMvc mockMvc;
    private TestRestTemplate template = new TestRestTemplate();
    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);
    @Before
    public void setUp(){
        mockMvc = MockMvcBuilders.standaloneSetup(new AccountController()).build();

    }

    @Test
    public void contextLoads() throws Exception {
        //mockMvc.perform(MockMvcRequestBuilders.get("/home").accept(MediaType.APPLICATION_JSON));
        String url = "http://localhost:8080/account/user";
        String result = template.getForObject(url,String.class);
        logger.info(result);
    }

}

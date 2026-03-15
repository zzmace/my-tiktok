package org.luckyjourney;

import org.luckyjourney.authority.AuthorityUtils;
import org.luckyjourney.authority.BaseAuthority;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableAsync
@EnableAspectJAutoProxy
@SpringBootApplication
@EnableTransactionManagement
@MapperScan(basePackages = "org.luckyjourney.mapper")
@EnableScheduling
public class LuckyJourneyApplication {

    public static void main(String[] args) {
        AuthorityUtils.setGlobalVerify(true,new BaseAuthority());
        SpringApplication.run(LuckyJourneyApplication.class, args);

    }


}

package com.xworkz.bikeshowroom.configuration;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;
import java.io.File;

@Slf4j
public class SpringWebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    public SpringWebInitializer(){
        log.info("Web Init object is created");
    }
    private int maxUploadSizeInMb = 5 * 1024 * 1024;

    @Override
    protected Class<?>[] getRootConfigClasses() {
        log.info("getRootConfigClasses is invoked");
        return new Class[0];
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        log.info("getServletConfigClasses is invoked");
        return new Class[]{SpringConfiguration.class};
    }

    @Override
    protected String[] getServletMappings() {
        log.info("getServletMappings is invoked");
        return new String[]{"/"};
    }
    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {

        File uploadDirectory = new File(System.getProperty("java.io.tmpdir"));

        MultipartConfigElement multipartConfigElement =
                new MultipartConfigElement(uploadDirectory.getAbsolutePath(),
                        maxUploadSizeInMb, maxUploadSizeInMb * 2, maxUploadSizeInMb / 2);

        registration.setMultipartConfig(multipartConfigElement);

    }
}

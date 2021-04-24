package com.phonemall.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.util.Date;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.HttpMethod;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.util.IOUtils;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Log4j
@Service
@RequiredArgsConstructor
@Getter
public class S3Service {
	final private AmazonS3 s3Client;
	
	String bucketName = "버킷명";
	String accessKey = "액세스키";
	String secretKey = "시크릿키";
	
	public S3Service() {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		
        this.s3Client = AmazonS3ClientBuilder.standard()
        		.withCredentials(new AWSStaticCredentialsProvider(credentials))
                .withRegion(Regions.AP_NORTHEAST_2)
                .build();
	}
	
	// upload original image file
	public void uploadFile(MultipartFile image, String s3Path) {
		
		try {
			// set ObjectMatadata
			byte[] bytes = IOUtils.toByteArray(image.getInputStream());
			
	        ObjectMetadata objectMetadata = new ObjectMetadata();
	        objectMetadata.setContentLength(bytes.length);
	        objectMetadata.setContentType(image.getContentType());
	        
	        // save in S3
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
			this.s3Client.putObject(this.bucketName, s3Path.replace(File.separatorChar, '/'), byteArrayInputStream, objectMetadata);
			
			byteArrayInputStream.close();
		}catch(Exception e){log.error(e.getMessage());}
	}
	
	// upload thumbnail image file
	public void uploadThumbFile(MultipartFile image, String thumbs3Path) {
		try {
			// make thumbnail image for s3
			BufferedImage bufferImage = ImageIO.read(image.getInputStream());
			BufferedImage thumbnailImage = Thumbnails.of(bufferImage).size(400, 333).asBufferedImage();
			
			ByteArrayOutputStream thumbOutput = new ByteArrayOutputStream();
			String imageType = image.getContentType();
			ImageIO.write(thumbnailImage, imageType.substring(imageType.indexOf("/")+1), thumbOutput);
			
			// set metadata
	        ObjectMetadata thumbObjectMetadata = new ObjectMetadata();
	        byte[] thumbBytes = thumbOutput.toByteArray();
	        thumbObjectMetadata.setContentLength(thumbBytes.length);
	        thumbObjectMetadata.setContentType(image.getContentType());
	        
			// save in s3
			InputStream thumbInput = new ByteArrayInputStream(thumbBytes);
			this.s3Client.putObject(this.bucketName, thumbs3Path.replace(File.separatorChar, '/'), thumbInput, thumbObjectMetadata);
			
			thumbInput.close();
			thumbOutput.close();
		}catch(Exception e){log.error(e.getMessage());}
	}

    // get presigned URL
    public String getFileURL(String fileName) {
        
        // set expiration
        Date expiration = new Date();
        long expTimeMillis = expiration.getTime();
        expTimeMillis += 1000 * 60 * 60; // 1 hour
        expiration.setTime(expTimeMillis);
        
        // Generate the presigned URL.
        GeneratePresignedUrlRequest generatePresignedUrlRequest =
                new GeneratePresignedUrlRequest(this.bucketName, (fileName).replace(File.separatorChar, '/'))
                        .withMethod(HttpMethod.GET)
                        .withExpiration(expiration);
        
        return this.s3Client.generatePresignedUrl(generatePresignedUrlRequest).toString();
    }
    
    // delete file
    public void deleteFile(String fileName) {
    	log.info("file name : "+ fileName);
    	try {
    	    this.s3Client.deleteObject(this.bucketName, (fileName).replace(File.separatorChar, '/'));
    	} catch (AmazonServiceException e) {
    		log.error("delete file error"+e.getMessage());
    	}
    }
    
}

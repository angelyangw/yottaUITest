package com.yottabyte.utils;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PdfToImages {

    public static List<byte[]> pdftoimages(InputStream fileInputStream) {
        List<byte[]> list = new ArrayList<>();
        byte[] bytes;
        try {
            PDDocument document = PDDocument.load(fileInputStream);
            PDFRenderer pdfRenderer = new PDFRenderer(document);
            for (int page = 0; page < document.getNumberOfPages(); ++page) {
                BufferedImage bim = pdfRenderer.renderImageWithDPI(page, 100, ImageType.RGB);
                ByteArrayOutputStream os=new ByteArrayOutputStream();
                ImageIO.write(bim, "png", os);
                bytes = os.toByteArray();
                list.add(bytes);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String args[]) throws IOException {
        InputStream is = new FileInputStream("e:\\1122.pdf");
        pdftoimages(is);
    }
}

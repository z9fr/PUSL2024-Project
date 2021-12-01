package com.example.xyzhotel.dao.client;

import io.github.cdimascio.dotenv.Dotenv;
import io.github.cdimascio.dotenv.DotenvException;

public class test {
    public static void main(String[] args) {
        Dotenv dotenv = null;
        dotenv = Dotenv.configure().load();

        String name = dotenv.get("OHHELOFRIEND");

        System.out.println(name);

    }
}

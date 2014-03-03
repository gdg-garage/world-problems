package com.google.devrel.samples.helloendpoints;

import com.google.api.server.spi.config.Api;
import com.google.api.server.spi.config.ApiMethod;
import com.google.appengine.api.users.User;

import java.util.ArrayList;

import javax.inject.Named;

/**
 * Defines v1 of a helloworld API, which provides simple "greeting" methods.
 */
@Api(
    name = "problems",
    version = "v1"
)
public class Greetings {

  @ApiMethod(path="random")
  public Problem getRandom() {
    return new Problem("test");
  }
}

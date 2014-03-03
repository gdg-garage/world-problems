package io.github.gdggarage.worldproblems;

import com.google.api.server.spi.config.Api;
import javax.inject.Named;
import java.util.ArrayList;
/**
 * Defines v1 of a helloworld API, which provides simple "greeting" methods.
 */
@Api(name = "problems", version = "v1")
public class Problems {
  public static ArrayList<Problem> greetings = new ArrayList<Problem>();

  static {
    greetings.add(new Problem("hello world!"));
    greetings.add(new Problem("goodbye world!"));
  }

  public Problem random() {
    return greetings.get(0);
  }
}
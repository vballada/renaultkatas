package bowling;

import java.util.Arrays;

public class BowlingService {

    public int computeScore(String pins) {
        return computeBasicScore(pins) + spareBonusForFirstFrame(pins);
    }

    private int spareBonusForFirstFrame(String pins) {
        return isFirstFrameSpare(pins) ? extractThirdThrowScore(pins) : 0;
    }

    private int computeBasicScore(String pins) {
        return Arrays.stream(pins.split(","))
                .mapToInt(Integer::parseInt)
                .sum();
    }

    private boolean isFirstFrameSpare(String pins) {
        return computeFirstFrameScore(pins) == 10;
    }

    private int computeFirstFrameScore(String pins) {
        return Character.getNumericValue(pins.charAt(0))
                + Character.getNumericValue(pins.charAt(2));
    }

    private int extractThirdThrowScore(String pins) {
        return Character.getNumericValue(pins.charAt(4));
    }

}

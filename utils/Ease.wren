import "math" for Math
/**
* Static class with useful easer functions that can be used by Tweens.
* Based on https://github.com/useflashpunk/FlashPunk/blob/master/net/flashpunk/utils/Ease.as
* and https://github.com/HaxePunk/HaxePunk/blob/dev/haxepunk/utils/Ease.hx
*/
class Ease {

    // Easing constants.
    PI { Num.pi }
    PI2 { Num.pi / 2 }
    EL { 2 * Num.pi / 0.45 }
    B1 { 1 / 2.75 }
    B2 { 2 / 2.75 }
    B3 { 1.5 / 2.75 }
    B4 { 2.5 / 2.75 }
    B5 { 2.25 / 2.75 }
    B6 { 2.625 / 2.75 }

    /**
    * Operation of in/out easers:
    * 
    * in(t)
    *  return t
    * out(t)
    *  return 1 - in(1 - t)
    * inOut(t)
    *   return (t <= 0.5) ? in(t * 2) / 2 : out(t * 2 - 1) / 2 + 0.5
    */

    /** Linear easing */
    static linear(t)
    {
        return t
    }

    /** Quadratic in. */
    static quadIn(t)
    {
        return t * t
    }

    /** Quadratic out. */
    static quadOut(t)
    {
        return -t * (t - 2)
    }

    /** Quadratic in and out. */
    static quadInOut(t)
    {
        return t <= 0.5 ? t * t * 2 : 1 - (--t) * t * 2
    }

    /** Cubic in. */
    static cubeIn(t)
    {
        return t * t * t
    }

    /** Cubic out. */
    static cubeOut(t)
    {
        return 1 + (--t) * t * t
    }

    /** Cubic in and out. */
    static cubeInOut(t)
    {
        return t <= 0.5 ? t * t * t * 4 : 1 + (--t) * t * t * 4
    }

    /** Quart in. */
    static quartIn(t)
    {
        return t * t * t * t
    }

    /** Quart out. */
    static quartOut(t)
    {
        return 1 - (t-=1) * t * t * t
    }

    /** Quart in and out. */
    static quartInOut(t)
    {
        return t <= 0.5 ? t * t * t * t * 8 : (1 - (t = t * 2 - 2) * t * t * t) / 2 + 0.5
    }

    /** Quint in. */
    static quintIn(t)
    {
        return t * t * t * t * t
    }

    /** Quint out. */
    static quintOut(t)
    {
        return (t = t - 1) * t * t * t * t + 1
    }

    /** Quint in and out. */
    static quintInOut(t)
    {
        return ((t *= 2) < 1) ? (t * t * t * t * t) / 2 : ((t -= 2) * t * t * t * t + 2) / 2
    }

    /** Sine in. */
    static sineIn(t)
    {
        return -Math.cos(PI2 * t) + 1
    }

    /** Sine out. */
    static sineOut(t)
    {
        return Math.sin(PI2 * t)
    }

    /** Sine in and out. */
    static sineInOut(t)
    {
        return -Math.cos(PI * t) / 2 + 0.5
    }

    /** Bounce in. */
    static bounceIn(t)
    {
        t = 1 - t
        if (t < B1) return 1 - 7.5625 * t * t
        if (t < B2) return 1 - (7.5625 * (t - B3) * (t - B3) + 0.75)
        if (t < B4) return 1 - (7.5625 * (t - B5) * (t - B5) + 0.9375)
        return 1 - (7.5625 * (t - B6) * (t - B6) + 0.984375)
    }

    /** Bounce out. */
    static bounceOut(t)
    {
        if (t < B1) return 7.5625 * t * t
        if (t < B2) return 7.5625 * (t - B3) * (t - B3) + 0.75
        if (t < B4) return 7.5625 * (t - B5) * (t - B5) + 0.9375
        return 7.5625 * (t - B6) * (t - B6) + 0.984375
    }

    /** Bounce in and out. */
    static bounceInOut(t)
    {
        if (t < 0.5)
        {
            t = 1 - t * 2
            if (t < B1) return (1 - 7.5625 * t * t) / 2
            if (t < B2) return (1 - (7.5625 * (t - B3) * (t - B3) + 0.75)) / 2
            if (t < B4) return (1 - (7.5625 * (t - B5) * (t - B5) + 0.9375)) / 2
            return (1 - (7.5625 * (t - B6) * (t - B6) + 0.984375)) / 2
        }
        t = t * 2 - 1
        if (t < B1) return (7.5625 * t * t) / 2 + 0.5
        if (t < B2) return (7.5625 * (t - B3) * (t - B3) + 0.75) / 2 + 0.5
        if (t < B4) return (7.5625 * (t - B5) * (t - B5) + 0.9375) / 2 + 0.5
        return (7.5625 * (t - B6) * (t - B6) + 0.984375) / 2 + 0.5
    }

    /** Circle in. */
    static circIn(t)
    {
        return -(Math.sqrt(1 - t * t) - 1)
    }

    /** Circle out. */
    static circOut(t)
    {
        return Math.sqrt(1 - (t - 1) * (t - 1))
    }

    /** Circle in and out. */
    static circInOut(t)
    {
        return t <= 0.5 ? (Math.sqrt(1 - t * t * 4) - 1) / -2 : (Math.sqrt(1 - (t * 2 - 2) * (t * 2 - 2)) + 1) / 2
    }

    /** Exponential in. */
    static expoIn(t)
    {
        return Math.pow(2, 10 * (t - 1))
    }

    /** Exponential out. */
    static expoOut(t)
    {
        return -Math.pow(2, -10 * t) + 1
    }

    /** Exponential in and out. */
    static expoInOut(t)
    {
        return t < 0.5 ? Math.pow(2, 10 * (t * 2 - 1)) / 2 : (-Math.pow(2, -10 * (t * 2 - 1)) + 2) / 2
    }

    /** Back in. */
    static backIn(t)
    {
        return t * t * (2.70158 * t - 1.70158)
    }

    /** Back out. */
    static backOut(t)
    {
        return 1 - (--t) * (t) * (-2.70158 * t - 1.70158)
    }

    /** Back in and out. */
    static backInOut(t)
    {
        t = t * 2
        if (t < 1) return t * t * (2.70158 * t - 1.70158) / 2
        t = t - 1
        return (1 - (--t) * (t) * (-2.70158 * t - 1.70158)) / 2 + 0.5
    }
}
<?php
declare(strict_types=1);

namespace {{_expr_:substitute(substitute(expand('%:hr'), '.*src[/]', '', 'g'), '[/]', '\\', 'g')}};

class {{_expr_:expand('%:t:r')}}
{

    private const HOGE = 1;
    private const FUGA = 2;

    private static function values()
    {
        return [
            static::HOGE,
            static::FUGA,
        ];
    }

    public static function hoge() : {{_expr_:expand('%:t:r')}}
    {
        return new self(static::HOGE);
    }

    public static function fuga() : {{_expr_:expand('%:t:r')}}
    {
        return new self(static::FUGA);
    }

    /**
     * @var int
     */
    private $value;

    /**
     * {{_expr_:expand('%:t:r')}} constructor.
     * @param int $value
     */
    public function __construct($value)
    {
        if (!in_array($value, static::values(), true)) {
            throw new \InvalidArgumentException("invalid value: $value");
        }
        $this->value = $value;
    }

    /**
     * @return int
     */
    public function getValue() : int
    {
        return $this->value;
    }

    /**
     * @return bool
     */
    public function isHoge() : bool
    {
        return $this->value === static::HOGE;
    }

    /**
     * @return bool
     */
    public function isFuga() : bool
    {
        return $this->value === static::FUGA;
    }
}

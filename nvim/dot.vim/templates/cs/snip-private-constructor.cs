/// <summary>プライベートコンストラクター</summary>
{{_expr_:expand('%:t:r')}}(string foo) : base(foo) {}

/// <summary>Create</summary>
/// <param name="foo">bar</param>
/// <returns>生成したインスタンス</returns>
public static {{_expr_:expand('%:t:r')}} Create(string foo)
{
    var that = new {{_expr_:expand('%:t:r')}}();

    return that;
}

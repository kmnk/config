package {{_expr_:substitute(substitute(expand('%:r'), '.*lib[/]', '', 'g'), '[/]', '::', 'g')}};

use strict;
use warnings;
use utf8;

{{_cursor_}}

1;
__END__

=head1 NAME

{{_expr_:substitute(substitute(expand('%:r'), '.*lib[/]', '', 'g'), '[/]', '::', 'g')}} - 


=head1 VERSION

最初のテンプレートには、通常は以下が含まれる：

This documentation refers to {{_expr_:substitute(substitute(expand('%:r'), '.*lib[/]', '', 'g'), '[/]', '::', 'g')}} version 0.0.1


=head1 SYNOPSIS

    use {{_expr_:substitute(substitute(expand('%:r'), '.*lib[/]', '', 'g'), '[/]', '::', 'g')}};

    # 最も一般的な使用法を示すため、簡単なサンプルコードを示す

    # 多くのユーザーが読むことになるので、
    # できるだけ教育的かつ模範的な内容にする

=head1 DESCRIPTION

モジュールとその機能を完全に説明する
サブセクションがいくつか含まれる場合がある (=head2、=head3 など)


=head1 SUBROUTINES/METHODS

モジュールのインターフェイスのパブリックコンポーネントごとにセクションを分ける
通常は、エクスポート可能なサブルーチンか、モジュールのクラスに属する
オブジェクトで呼び出すメソッドが含まれる
セクションには内容に応じた名前を付ける

オブジェクト指向のモジュールでは、読み手が概要を捉えるための
「このクラスのオブジェクトは～を表す」という文章で始め、
そのあとで説明するメソッドを理解しやすい状況を整える


=head1 DIAGNOSTICS

モジュールによって生成される可能性があるエラーと警告メッセージを
すべて明記する（実際には「発生しないはずのもの」を含む）
これらの問題ごとに、完全な説明、原因として考えられるもの、
推奨される修復案を明記する


=head1 CONFIGURATION AND ENVIRONMENT

モジュールが使用するコンフィグレーションシステムを完全に説明する
これには、コンフィグレーションファイルの名前と場所、設定可能な
環境変数またはプロパティの意味が含まれる
これらの説明には、使用するコンフィグレーション言語の詳細も
含まれていなければならない


=head1 DEPENDENCIES

このモジュールが依存する他のモジュールをすべて明記する
バージョンの制限、それらの必須モジュールがPerlの標準
ディストリビューションに含まれているか、モジュールの
ディストリビューションに含まれているか、それとも別にインストール
しなければならないかを明記する


=head1 INCOMPATIBILITIES

このモジュールと併用できないモジュールをすべて明記する
原因としては、インターフェイスで使用している名前が競合する、
システムリソースまたはプログラムリソースが競合する、
またはPerlの内部制限が考えられる（たとえば、ソースコードフィルタ
を使用するモジュールの多くは相互排他である）


=head1 BUGS AND LIMITATIONS

モジュールに問題があることがわかっている場合は、それらをすべて明記する
将来のリリースで修正される可能性があるかどうかも明記する

また、モジュールが提供する機能に制限がある場合は、それも明記する
対応していないデータ型、パフォーマンス上の問題点とそれらが発生する状況、
データセットのサイズに関する実際的な制限、
（まだ）対応していない特殊ケースなど


最初のテンプレートには、通常以下が含まれる：

There are no known bugs in this module.
Please report problems to AUTHOR
Patches are welcome.


=head1 AUTHOR

kmnk (kmnknmk+perl@gmail.com)


=head1 LICENSE AND COPYRIGHT

Copyright (c) <年> kmnk (kmnknmk+perl@gmail.com). All rights reserved.

MIT License


=cut

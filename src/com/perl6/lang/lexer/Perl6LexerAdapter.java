package com.perl6.lang.lexer;

/**
 * Created by hurricup on 12.04.2015.
 */
import com.intellij.lexer.FlexAdapter;

import java.io.Reader;

public class Perl6LexerAdapter extends FlexAdapter {
	public Perl6LexerAdapter() {
		super(new Perl6Lexer((Reader) null));
	}
}
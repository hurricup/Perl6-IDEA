package com.perl6;

/**
 * Created by hurricup on 12.04.2015.
 */

import com.intellij.lang.Language;

/**
 * All main properties for Groovy language
 *
 * @author ilyas
 */
public class Perl6Language extends Language {

	public static final Perl6Language INSTANCE = new Perl6Language();

	public Perl6Language() {
		super("Perl6");
	}

	@Override
	public boolean isCaseSensitive() {
		return true;
	}
}


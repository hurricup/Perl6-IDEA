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
public class PerlLanguage extends Language {

	public static final PerlLanguage INSTANCE = new PerlLanguage();

	public PerlLanguage() {
		super("Perl6");
	}

	@Override
	public boolean isCaseSensitive() {
		return true;
	}
}


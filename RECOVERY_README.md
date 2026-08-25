# CivicVoice — Recovered Project

This folder was reconstructed from the supplied `CivicVoice.war`.

## What is included
- Original WAR contents extracted as-is.
- `WEB-INF/classes` compiled application classes preserved under `recovered-bytecode/`.
- Readable `javap` class/method/bytecode listings under `decompiled-reference/`.
- Original JSP, XML, properties, libraries, and Maven files preserved.

## Java source recovery
The WAR contains compiled `.class` files rather than the original `.java` source. The original source therefore cannot be restored byte-for-byte. A Java decompiler such as CFR can reconstruct editable Java source from the class files; CFR documents whole-JAR output with `--outputdir` and is available from its official project/release pages.

The recovered project tree is intentionally kept faithful to the WAR so nothing is discarded.

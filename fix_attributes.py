import re

with open("book/08-customizing-git/sections/attributes.asc", "r") as f:
    text = f.read()

# Replace the export-subst section manually translated, with the actual section matching the source
original_export_subst = """===== `export-subst`

When exporting files for deployment you can apply ``git log```'s formatting and keyword-expansion processing to selected portions of files marked with the ``export-subst`` attribute.

For instance, if you want to include a file named `LAST_COMMIT` in your project, and have metadata about the last commit automatically injected into it when `git archive` runs, you can for example set up your `.gitattributes` and `LAST_COMMIT` files like this:

[source,ini]
----
LAST_COMMIT export-subst
----

[source,console]
----
$ echo 'Last commit date: $Format:%cd by %aN$' > LAST_COMMIT
$ git add LAST_COMMIT .gitattributes
$ git commit -am 'adding LAST_COMMIT file for archives'
----

When you run `git archive`, the contents of the archived file will look like this:

[source,console]
----
$ git archive HEAD | tar xCf ../deployment-testing -
$ cat ../deployment-testing/LAST_COMMIT
Last commit date: Tue Apr 21 08:38:48 2009 -0700 by Scott Chacon
----

The substitutions can include for example the commit message and any `git notes`, and `git log` can do simple word wrapping:

[source,console]
----
$ echo '$Format:Last commit: %h by %aN at %cd%n%+w(76,6,9)%B$' > LAST_COMMIT
$ git commit -am 'export-subst uses git log'\''s custom formatter

git archive uses git log'\''s `pretty=format:` processor
directly, and strips the surrounding `$Format:` and `$`
markup from the output.
'
$ git archive @ | tar xfO - LAST_COMMIT
Last commit: 312ccc8 by Jim Hill at Fri May 8 09:14:04 2015 -0700
       export-subst uses git log's custom formatter

         git archive uses git log's `pretty=format:` processor directly, and
         strips the surrounding `$Format:` and `$` markup from the output.
----

The resulting archive is suitable for deployment work, but like any exported archive it isn't suitable for further development work."""

translated_export_subst = """===== `export-subst` (استبدال التصدير)

عند تصدير الملفات للنشر (deployment) يمكنك تطبيق معالجة التنسيق (formatting) وتوسيع الكلمات الرئيسية (keyword-expansion) الخاصة بـ ``git log`` على أجزاء محددة (selected portions) من الملفات المحددة بالسمة ``export-subst``.

على سبيل المثال، إذا كنت ترغب في تضمين ملف باسم `LAST_COMMIT` في مشروعك، وأن يتم حقن البيانات الوصفية (metadata) حول التأكيد الأخير فيه تلقائياً عند تشغيل `git archive`، يمكنك على سبيل المثال إعداد ملفي `.gitattributes` و `LAST_COMMIT` كالتالي:

[source,ini]
----
LAST_COMMIT export-subst
----

[source,console]
----
$ echo 'Last commit date: $Format:%cd by %aN$' > LAST_COMMIT
$ git add LAST_COMMIT .gitattributes
$ git commit -am 'adding LAST_COMMIT file for archives'
----

عند تشغيل `git archive`، ستبدو محتويات هذا الملف المؤرشف كالتالي:

[source,console]
----
$ git archive HEAD | tar xCf ../deployment-testing -
$ cat ../deployment-testing/LAST_COMMIT
Last commit date: Tue Apr 21 08:38:48 2009 -0700 by Scott Chacon
----

يمكن أن تتضمن الاستبدالات (substitutions) على سبيل المثال رسالة التأكيد (commit message) وأي ملاحظات (`git notes`)، ويمكن لـ `git log` القيام بالتفاف بسيط للكلمات (simple word wrapping):

[source,console]
----
$ echo '$Format:Last commit: %h by %aN at %cd%n%+w(76,6,9)%B$' > LAST_COMMIT
$ git commit -am 'export-subst uses git log'\''s custom formatter

git archive uses git log'\''s `pretty=format:` processor
directly, and strips the surrounding `$Format:` and `$`
markup from the output.
'
$ git archive @ | tar xfO - LAST_COMMIT
Last commit: 312ccc8 by Jim Hill at Fri May 8 09:14:04 2015 -0700
       export-subst uses git log's custom formatter

         git archive uses git log's `pretty=format:` processor directly, and
         strips the surrounding `$Format:` and `$` markup from the output.
----

الأرشيف الناتج (resulting archive) مناسب لعملية النشر (deployment work)، ولكنه مثل أي أرشيف مُصدَّر ليس مناسباً لمزيد من أعمال التطوير (further development work)."""

# First, let's copy the entire original file, but translate it chunk by chunk, so we don't hallucinate anything.

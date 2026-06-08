# A Pro Git (2. kiadás) fordítása

A fordításokat decentralizált módon kezeljük. Minden fordítócsapat saját projektet üzemeltet. Minden fordítás külön tárolóban található, a Pro Git csapat egyszerűen beolvassa a változtatásokat és beépíti azokat a [https://git-scm.com](https://git-scm.com) weboldalba, amikor azok készen állnak.

## Általános irányelvek a Pro Git fordításához

A Pro Git egy technikai eszközről szóló könyv, ezért a fordítása nehezebb, mint egy nem technikai szövegé.

Az alábbi irányelvek segíthetnek a munkában:

* Mielőtt nekilátna, olvassa végig az angol nyelvű Pro Git könyvet, hogy tisztában legyen a tartalommal és a használt stílussal.
* Biztosítsa, hogy jó gyakorlati ismerete van a Git-ről, hogy a technikai kifejezések lefordítása ne jelenthessen problémát.
* Kövessen egy egységes stílust és formátumot a fordítás során.
* Mindenképpen tanulmányozza és értse meg az [Asciidoc formázás](https://docs.asciidoctor.org/asciidoc/latest/syntax-quick-reference/) alapjait. Az asciidoc szintaxis nem betartása problémákat okozhat a könyv pdf, epub és html változatainak összeállításában.

## A könyv fordítása más nyelvre

### Segítségnyújtás meglévő projektben

* Ellenőrizze a meglévő projekteket az alábbi táblázatban.
* Látogasson el a projekt GitHub oldalára.
* Nyisson egy kérdést, mutatkozzon be és kérdezze meg, hogy miben tud segíteni.

| Nyelv     | GitHub oldal     |
| :------------- | :------------- |
| العربية | [progit2-ar/progit2](https://github.com/progit2-ar/progit2) |
| Беларуская  | [progit/progit2-be](https://github.com/progit/progit2-be) |
| български език | [progit/progit2-bg](https://github.com/progit/progit2-bg) |
| Čeština    | [progit-cs/progit2-cs](https://github.com/progit-cs/progit2-cs) |
| English    | [progit/progit2](https://github.com/progit/progit2) |
| Español    | [progit/progit2-es](https://github.com/progit/progit2-es) |
| فارسی | [progit2-fa/progit2](https://github.com/progit2-fa/progit2) |
| Français   | [progit/progit2-fr](https://github.com/progit/progit2-fr) |
| Deutsch    | [progit/progit2-de](https://github.com/progit/progit2-de) |
| Ελληνικά   | [progit2-gr/progit2](https://github.com/progit2-gr/progit2) |
| Indonesian | [progit/progit2-id](https://github.com/progit/progit2-id) |
| Italiano   | [progit/progit2-it](https://github.com/progit/progit2-it) |
| 日本語   | [progit/progit2-ja](https://github.com/progit/progit2-ja) |
| 한국어   | [progit/progit2-ko](https://github.com/progit/progit2-ko) |
| Magyar | [dabzse/progit2](https://github.com/dabzse/progit2) |
| Македонски | [progit2-mk/progit2](https://github.com/progit2-mk/progit2) |
| Bahasa Melayu| [progit2-ms/progit2](https://github.com/progit2-ms/progit2) |
| Nederlands | [progit/progit2-nl](https://github.com/progit/progit2-nl) |
| Polski | [progit2-pl/progit2-pl](https://github.com/progit2-pl/progit2-pl) |
| Português (Brasil) | [progit/progit2-pt-br](https://github.com/progit/progit2-pt-br) |
| Русский   | [progit/progit2-ru](https://github.com/progit/progit2-ru) |
| Slovenščina  | [progit/progit2-sl](https://github.com/progit/progit2-sl) |
| Српски   | [progit/progit2-sr](https://github.com/progit/progit2-sr) |
| Svenska  | [progit2-sv/progit2](https://github.com/progit2-sv/progit2) |
| Tagalog   | [progit2-tl/progit2](https://github.com/progit2-tl/progit2) |
| Türkçe   | [progit/progit2-tr](https://github.com/progit/progit2-tr) |
| Українська| [progit/progit2-uk](https://github.com/progit/progit2-uk) |
| Ўзбекча  | [progit/progit2-uz](https://github.com/progit/progit2-uz) |
| 简体中文  | [progit/progit2-zh](https://github.com/progit/progit2-zh) |
| 正體中文  | [progit/progit2-zh-tw](https://github.com/progit/progit2-zh-tw) |

### Új fordítás indítása

Ha még nincs projekt az anyanyelvén, elindíthatja a saját fordítást.

Munkáját a könyv második kiadására alapozza, amely [itt](https://github.com/progit/progit2) érhető el:

 1. Válassza ki a nyelvének megfelelő [ISO 639 kódot](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes).
 2. Hozzon létre egy [GitHub szervezetet](https://docs.github.com/en/organizations/collaborating-with-groups-in-organizations/creating-a-new-organization-from-scratch), például: `progit2-[Ön kódja]` a GitHub felületén.
 3. Hozzon létre egy `progit2` projektet.
 4. Másolja át a progit/progit2 (ez a projekt) szerkezetét a saját projektjébe és kezdje el fordítani.

### A fordítás állapotának frissítése

A [https://git-scm.com](https://git-scm.com) oldalon a fordítások három kategóriába sorolhatók. Amint elért egy szintet, lépjen kapcsolatba a [https://git-scm.com](https://git-scm.com) karbantartóival, hogy beolvashassák a változtatásokat.

| Kategória | Készültségi szint     |
| :------------- | :------------- |
| Fordítás elindítva (ehhez) | Bevezető lefordítva, más még nem. |
| Részleges fordítás elérhető (itt) | az első 6 fejezet lefordítva. |
| Teljes fordítás elérhető (itt) | a könyv (majdnem) teljesen lefordítva. |

## Folyamatos integráció GitHub Actions-szel

A GitHub Actions egy [folyamatos integrációs](https://en.wikipedia.org/wiki/Continuous_integration) szolgáltatás, amely integrálódik a GitHubbal. A GitHub Actions segítségével ellenőrizhető, hogy egy húzási kérelem (pull-request) nem teszi tönkre az összeállítást. A GitHub Actions a könyv lefordított változatait is képes biztosítani.

A GitHub Actions konfigurációja a `.github/workflows` könyvtárban található, és ha a fő tároló `main` ágát használja, akkor ezeket automatikusan megkapja.
Ha azonban a fordítási tárolót a gyökér tároló _elágaztatásával_ hozta létre, akkor van egy további lépés, amit el kell végeznie (ha nem végzett elágazást, akkor ez a rész kihagyható).
A GitHub feltételezi, hogy az elágazásokaz arra használják, hogy hozzájáruljanak az eredeti tárolóhoz, ezért az elágazott tárolón fel kell keresni a "Műveletek" lapot, és a "Megértem a munkafolyamatokat" gombra kell kattintani a műveletek futtatásának engedélyezéséhez.

## E-könyv kiadási lánc beállítása

TEz egy technikai feladat, kérjük vegye fel a kapcsolatot @jnavila-val az epub kiadás elindításához.

## A Pro Git-en túl

A könyv fordítása csak az első lépés. Miután ez elkészült, fontolóra veheti a Git felhasználói felületének fordítását.

Ez a feladat technikai szempontból összetettebb, mint a könyv fordítása. Remélhetőleg, miután lefordította a teljes könyvet, megérti az alkalmazásban használt kifejezéseket. Ha úgy érzi, technikailag felkészült a feladatra, a tároló [itt](https://github.com/git-l10n/git-po) található, és csak követni kell az útmutatót.

Azonban vegye figyelembe, hogy

* specifikusabb eszközökre lesz szükség a lokalizációs po fájlok kezeléséhez (például a [poedit](https://poedit.net/)) és egyesítéséhez. Lehet, hogy le kell forditani a Git-et a munka ellenőrzéséhez.
* szükség lesz az alkalmazások fordításának alapvető ismeretére, ami jelentősen eltér a könyvek fordításától.
* a Git mag projekt szigorúbb [eljárásokat](https://github.com/git-l10n/git-po/blob/master/Documentation/SubmittingPatches) követ a közreműködések elfogadásakor, mindenképpen tartsa be azokat.

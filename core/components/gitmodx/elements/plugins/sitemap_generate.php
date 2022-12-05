<?php
switch ($modx->event->name) {
    case 'OnPageNotFound':
        switch($_GET['q']) {
            case 'sitemap.xml':
                header("Content-type: text/xml");
                echo '<?xml version="1.0" encoding="utf-8"?>
                   <sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
                    <sitemap>
                      <loc>'.MODX_SITE_URL.'sitemap_categories.xml</loc>
                      <lastmod>'.date("Y-m-d").'</lastmod>
                    </sitemap>
                    <sitemap>
                      <loc>'.MODX_SITE_URL.'sitemap_podbor_kraski.xml</loc>
                      <lastmod>'.date("Y-m-d").'</lastmod>
                    </sitemap>
                    <sitemap>
                      <loc>'.MODX_SITE_URL.'sitemap_products.xml</loc>
                      <lastmod>'.date("Y-m-d").'</lastmod>
                    </sitemap>
                    <sitemap>
                      <loc>'.MODX_SITE_URL.'sitemap_info.xml</loc>
                      <lastmod>'.date("Y-m-d").'</lastmod>
                    </sitemap>
                    <sitemap>
                      <loc>'.MODX_SITE_URL.'sitemap_brands.xml</loc>
                      <lastmod>'.date("Y-m-d").'</lastmod>
                    </sitemap>
                    <sitemap>
                      <loc>'.MODX_SITE_URL.'sitemap_articles.xml</loc>
                      <lastmod>'.date("Y-m-d").'</lastmod>
                    </sitemap>
                    </sitemapindex>';
                die();
                break;
            case 'sitemap_categories.xml':
                $pars_product = array(
                    'tpl' => 'tplSitemapXml',
                    'parents' => '2,160',
                    'depth' => 4,
                    'limit' => 0,
                    'showDeleted' => 0,
                    'showUnpublished' => 0,
                    'where' => '{"template:IN":[35,37,46,21,43,42,24]}'
                );

                $output_offer = $modx->runSnippet('pdoResources', $pars_product);
                $file_product = '<?xml version="1.0" encoding="UTF-8"?>
                    <urlset xmlns="https://www.sitemaps.org/schemas/sitemap/0.9" >'.$output_offer.'</urlset>';
                print $file_product;
                die();
                break;
            case 'sitemap_podbor_kraski.xml':
                $pars_product = array(
                    'tpl' => 'tplSitemapXml',
                    'parents' => '29312',
                    'depth' => 4,
                    'limit' => 0,
                    'showDeleted' => 0,
                    'showUnpublished' => 0,
                    'where' => '{"template:IN":[44]}'
                );

                $output_offer = $modx->runSnippet('pdoResources', $pars_product);
                $file_product = '<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'.$output_offer.'</urlset>';
                print $file_product;
                die();
                break;
            case 'sitemap_products.xml':
                $pars_product = array(
                    'tpl' => 'tplSitemapXml',
                    'parents' => '160',
                    'depth' => 4,
                    'limit' => 0,
                    'showDeleted' => 0,
                    'showUnpublished' => 0,
                    'where' => '{"template:IN":[20]}'
                );

                $output_offer = $modx->runSnippet('pdoResources', $pars_product);
                $file_product = '<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'.$output_offer.'</urlset>';
                print $file_product;
                die();
                break;
            case 'sitemap_info.xml':
                $pars_product = array(
                    'tpl' => 'tplSitemapXml',
                    'parents' => '2,-162',
                    'depth' => 4,
                    'limit' => 0,
                    'showDeleted' => 0,
                    'showUnpublished' => 0,
                    'where' => '{"template:IN":[40,9,36,6,29,33,1,27]}'
                );

                $output_offer = $modx->runSnippet('pdoResources', $pars_product);
                $file_product = '<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'.$output_offer.'</urlset>';
                print $file_product;
                die();
                break;
            case 'sitemap_brands.xml':
                $pars_product = array(
                    'tpl' => 'tplSitemapXml',
                    'parents' => '160,29288',
                    'depth' => 4,
                    'limit' => 0,
                    'showDeleted' => 0,
                    'showUnpublished' => 0,
                    'where' => '{"template:IN":[39]}'
                );

                $output_offer = $modx->runSnippet('pdoResources', $pars_product);
                $file_product = '<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'.$output_offer.'</urlset>';
                print $file_product;
                die();
                break;
            case 'sitemap_articles.xml':
                $pars_product = array(
                    'tpl' => 'tplSitemapXml',
                    'parents' => '162,163',
                    'depth' => 4,
                    'limit' => 0,
                    'showDeleted' => 0,
                    'showUnpublished' => 0
                );

                $output_offer = $modx->runSnippet('pdoResources', $pars_product);
                $file_product = '<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'.$output_offer.'</urlset>';
                print $file_product;
                die();
                break;
        }
}
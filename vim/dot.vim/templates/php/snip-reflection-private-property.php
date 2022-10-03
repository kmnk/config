$c = new Class();
$r = new \ReflectionClass($c);
$p = $r->getProperty('privateProperty');
$p->setAccessible(true);
$p->setValue($c, 'hoge');

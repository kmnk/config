$c = new Class();
$r = new \ReflectionClass($c);
$m = $r->getMethod('doAction');
$m->setAccessible(true);
$result = $m->invokeArgs($c, []);

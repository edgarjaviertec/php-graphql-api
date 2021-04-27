<?php

class BaseRoute
{
    protected $f3;
    protected $account;  // Datos de la cuenta del inicio de sesión actual

    function __construct()
    {
        $f3 = Base::instance();
        $this->f3 = $f3;
    }
}

?>
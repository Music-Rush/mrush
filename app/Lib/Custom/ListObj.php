<?php

namespace App\Lib\Custom;

use PhpParser\Node\Expr\Cast\Object;

class ListObj implements \Iterator
{
    private $param = array();
    private $listName;

    public function __construct($name = 'Custom list')
    {
        $this->listName = $name;
    }

    public function Add($item)
    {
        if ((count($this->param) == 0) || (gettype($item) == gettype($this->param[0])))
            $this->param[] = $item;
        else
        {
            if (is_object($this->param[0]))
                $type = get_class($this->param[0]);
            else
                $type = gettype($this->param[0]);
            dd('Error! This list \'' . $this->listName . '\' can contain only objects with type ' . $type);
        }
    }

    public function First()
    {
        if (count($this->param) > 0)
            return $this->param[0];

        return null;
    }

    public function Last()
    {
        $last = $this->param[count($this->param) - 1];
        return $last;
    }

    public function Remove($removeItem)
    {
        foreach ($this->param as $key => $item) {
            if ($item == $removeItem) {
                unset($this->param[$key]);
                break;
            }
        }

        $this->param = array_values($this->param);
    }

    public function RemoveAt($index)
    {
        foreach ($this->param as $key => $item) {
            if ($key == $index) {
                unset($this->param[$key]);
                break;
            }
        }

        $this->param = array_values($this->param);
    }

    function rewind()
    {
        reset($this->param);
    }

    function current()
    {
        $var = current($this->param);
        return $var;
    }

    function key()
    {
        $var = key($this->param);
        return $var;
    }

    function next()
    {
        $var = next($this->param);
        return $var;
    }

    function valid()
    {
        $key = key($this->param);
        $var = ($key !== NULL && $key !== FALSE);
        return $var;
    }
}
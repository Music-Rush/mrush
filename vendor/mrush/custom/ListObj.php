<?php

namespace vendor\mrush\custom;

class ListObj implements \Iterator
{
    private $param = array();

    public function Add($item)
    {
        $param[] = $item;
    }

    public function Last()
    {
        $last = $this->param[count($this->param) - 1];
        return $last;
    }

    public function Remove($removeItem)
    {
        foreach ($this->param as $key => $item)
        {
            if ($item == $removeItem)
            {
                unset($this->param[$key]);
                break;
            }
        }

        $this->param = array_values($this->param);
    }

    public function RemoveAt($index)
    {
        foreach ($this->param as $key => $item)
        {
            if ($key == $index)
            {
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
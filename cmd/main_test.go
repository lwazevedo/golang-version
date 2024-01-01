package main

import (
	"testing"
)

func TestT(t *testing.T) {
	if 1 < 2 {
		t.Errorf("Teste falhou")
	}
}

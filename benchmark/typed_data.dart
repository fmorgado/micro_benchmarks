library micro_benchmarks.typed_data;

import 'dart:typed_data';
import '_bench.dart';

main() {
  final bytes = new Uint8List(1024);
  
  new BenchmarkSet('Uint8')
    ..add(new _Uint8ListBench(bytes, 69))
    ..add(new _Uint8DataBench(bytes, 69))
    ..report();
  
  new BenchmarkSet('Int32')
    ..add(new _Int32ListBench(bytes, 69))
    ..add(new _Int32DataBench(bytes, 69))
    ..report();
  
  new BenchmarkSet('Uint32')
    ..add(new _Uint32ListBench(bytes, 69))
    ..add(new _Uint32DataBench(bytes, 69))
    ..report();
  
  new BenchmarkSet('Uint32 NoCache')
    ..add(new _Uint32ListNoCacheBench(bytes, 69))
    ..add(new _Uint32DataNoCacheBench(bytes, 69))
    ..report();
  
  new BenchmarkSet('Int64')
    ..add(new _Int64ListBench(bytes, 69))
    ..add(new _Int64DataBench(bytes, 69))
    ..report();
  
  new BenchmarkSet('Uint64')
    ..add(new _Uint64ListBench(bytes, 69))
    ..add(new _Uint64DataBench(bytes, 69))
    ..report();
  
  new BenchmarkSet('Uint64 NoCache')
    ..add(new _Uint64ListNoCacheBench(bytes, 69))
    ..add(new _Uint64DataNoCacheBench(bytes, 69))
    ..report();
  
  new BenchmarkSet('Float32')
    ..add(new _Float32ListBench(bytes, 69.6))
    ..add(new _Float32DataBench(bytes, 69.6))
    ..report();
  
  new BenchmarkSet('Float32 NoCache')
    ..add(new _Float32ListNoCacheBench(bytes, 69.6))
    ..add(new _Float32DataNoCacheBench(bytes, 69.6))
    ..report();
  
  new BenchmarkSet('Float64')
    ..add(new _Float64ListBench(bytes, 69.6))
    ..add(new _Float64DataBench(bytes, 69.6))
    ..report();
  
  new BenchmarkSet('Float64 NoCache')
    ..add(new _Float64ListNoCacheBench(bytes, 69.6))
    ..add(new _Float64DataNoCacheBench(bytes, 69.6))
    ..report();
}

class _Uint8ListBench extends BenchmarkBase {
  final Uint8List bytes;
  final int value;
  _Uint8ListBench(this.bytes, this.value): super('Uint8 List');
  void run() {
    bytes[0] = value;
  }
}

class _Uint8DataBench extends BenchmarkBase {
  final Uint8List bytes;
  final ByteData  data;
  final int value;
  _Uint8DataBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new ByteData.view(bytes.buffer),
        super('Uint8 Data');
  void run() {
    data.setUint8(0, value);
  }
}

class _Uint32ListBench extends BenchmarkBase {
  final Uint8List bytes;
  final Uint32List data;
  final int value;
  _Uint32ListBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new Uint32List.view(bytes.buffer),
        super('Uint32 List');
  void run() {
    data[0] = value;
  }
}

class _Uint32DataBench extends BenchmarkBase {
  final Uint8List bytes;
  final ByteData  data;
  final int value;
  _Uint32DataBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new ByteData.view(bytes.buffer),
        super('Uint32 Data');
  void run() {
    data.setUint32(0, value);
  }
}

class _Int32ListBench extends BenchmarkBase {
  final Uint8List bytes;
  final Int32List data;
  final int value;
  _Int32ListBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new Int32List.view(bytes.buffer),
        super('Int32 List');
  void run() {
    data[0] = value;
  }
}

class _Int32DataBench extends BenchmarkBase {
  final Uint8List bytes;
  final ByteData  data;
  final int value;
  _Int32DataBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new ByteData.view(bytes.buffer),
        super('Int32 Data');
  void run() {
    data.setInt32(0, value);
  }
}

class _Uint32ListNoCacheBench extends BenchmarkBase {
  final Uint8List bytes;
  final int value;
  _Uint32ListNoCacheBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        super('Uint32 List NoCache');
  void run() {
    new Uint32List.view(bytes.buffer)[0] = value;
  }
}

class _Uint32DataNoCacheBench extends BenchmarkBase {
  final Uint8List bytes;
  final int value;
  _Uint32DataNoCacheBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        super('Uint32 Data NoCache');
  void run() {
    new ByteData.view(bytes.buffer).setUint32(0, value);
  }
}

class _Uint64ListBench extends BenchmarkBase {
  final Uint8List bytes;
  final Uint64List data;
  final int value;
  _Uint64ListBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new Uint64List.view(bytes.buffer),
        super('Uint64 List');
  void run() {
    data[0] = value;
  }
}

class _Uint64DataBench extends BenchmarkBase {
  final Uint8List bytes;
  final ByteData  data;
  final int value;
  _Uint64DataBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new ByteData.view(bytes.buffer),
        super('Uint64 Data');
  void run() {
    data.setUint64(0, value);
  }
}

class _Int64ListBench extends BenchmarkBase {
  final Uint8List bytes;
  final Int64List data;
  final int value;
  _Int64ListBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new Int64List.view(bytes.buffer),
        super('Int64 List');
  void run() {
    data[0] = value;
  }
}

class _Int64DataBench extends BenchmarkBase {
  final Uint8List bytes;
  final ByteData  data;
  final int value;
  _Int64DataBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new ByteData.view(bytes.buffer),
        super('Int64 Data');
  void run() {
    data.setInt64(0, value);
  }
}

class _Uint64ListNoCacheBench extends BenchmarkBase {
  final Uint8List bytes;
  final int value;
  _Uint64ListNoCacheBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        super('Uint64 List NoCache');
  void run() {
    new Uint64List.view(bytes.buffer)[0] = value;
  }
}

class _Uint64DataNoCacheBench extends BenchmarkBase {
  final Uint8List bytes;
  final int value;
  _Uint64DataNoCacheBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        super('Uint64 Data NoCache');
  void run() {
    new ByteData.view(bytes.buffer).setUint64(0, value);
  }
}

class _Float32ListBench extends BenchmarkBase {
  final Uint8List bytes;
  final Float32List data;
  final double value;
  _Float32ListBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new Float32List.view(bytes.buffer),
        super('Float32 List');
  void run() {
    data[0] = value;
  }
}

class _Float32DataBench extends BenchmarkBase {
  final Uint8List bytes;
  final ByteData  data;
  final double value;
  _Float32DataBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new ByteData.view(bytes.buffer),
        super('Float32 Data');
  void run() {
    data.setFloat32(0, value);
  }
}

class _Float32ListNoCacheBench extends BenchmarkBase {
  final Uint8List bytes;
  final double value;
  _Float32ListNoCacheBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        super('Float32 List NoCache');
  void run() {
    new Float32List.view(bytes.buffer)[0] = value;
  }
}

class _Float32DataNoCacheBench extends BenchmarkBase {
  final Uint8List bytes;
  final double value;
  _Float32DataNoCacheBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        super('Float32 Data NoCache');
  void run() {
    new ByteData.view(bytes.buffer).setFloat32(0, value);
  }
}

class _Float64ListBench extends BenchmarkBase {
  final Uint8List bytes;
  final Float64List data;
  final double value;
  _Float64ListBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new Float64List.view(bytes.buffer),
        super('Float64 List');
  void run() {
    data[0] = value;
  }
}

class _Float64DataBench extends BenchmarkBase {
  final Uint8List bytes;
  final ByteData  data;
  final double value;
  _Float64DataBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        data = new ByteData.view(bytes.buffer),
        super('Float64 Data');
  void run() {
    data.setFloat64(0, value);
  }
}

class _Float64ListNoCacheBench extends BenchmarkBase {
  final Uint8List bytes;
  final double value;
  _Float64ListNoCacheBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        super('Float64 List NoCache');
  void run() {
    new Float64List.view(bytes.buffer)[0] = value;
  }
}

class _Float64DataNoCacheBench extends BenchmarkBase {
  final Uint8List bytes;
  final double value;
  _Float64DataNoCacheBench(Uint8List bytes, this.value)
      : this.bytes = bytes,
        super('Float64 Data NoCache');
  void run() {
    new ByteData.view(bytes.buffer).setFloat64(0, value);
  }
}

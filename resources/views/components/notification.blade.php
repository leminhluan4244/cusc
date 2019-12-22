{{--Kiểm tra lỗi trên validation--}}
@if (count($errors) > 0)
    <script>
        @foreach ($errors->all() as $error)
        toastr.error('{{$error }}', 'Lỗi nhập dữ liệu!', {timeOut : 0, extendedTimeOut: 0});
        @endforeach
    </script>
@endif

{{----Kiểm tra lỗi nếu có----}}
@if (session()->has('error'))
    <script>
        @foreach(session('error') as $value)
        toastr.error('{{$value}}', 'Thao tác thất bại');
        @endforeach
    </script>
@endif

{{--Kiểm tra thành công--}}
@if (session()->has('success'))
    <script>
        @foreach(session('success') as $value)
        toastr.success('{{$value}}', 'Thao tác thành công');
        @endforeach
    </script>
@endif

/*!
Rescalendar.js - https://cesarchas.es/rescalendar
Licensed under the MIT license - http://opensource.org/licenses/MIT

Copyright (c) 2019 César Chas
*/



;(function($) {

    $.fn.rescalendar = function( options ) {

        function alert_error( error_message ){

            return [
                '<div class="error_wrapper">',

                      '<div class="thumbnail_image vertical-center">',
                      
                        '<p>',
                            '<span class="error">',
                                error_message,
                            '</span>',
                        '</p>',
                      '</div>',

                    '</div>'
            ].join('');
        
        }

        function set_template( targetObj, settings ){

            var template = '',
                id = targetObj.attr('id') || '';

            if( id == '' || settings.dataKeyValues.length == 0 ){

                targetObj.html( alert_error( settings.lang.init_error + ': No id or dataKeyValues' ) );
                return false;
            
            }

            if( settings.refDate.length != 10 ){

                targetObj.html( alert_error( settings.lang.no_ref_date ) );
                return false;
                
            }


            template = settings.template_html( targetObj, settings );

            targetObj.html( template );

            return true;

        };

        function dateInRange( date, startDate, endDate ){

            if( date == startDate || date == endDate ){
                return true;
            }

            var date1        = moment( startDate, settings.format ),
                date2        = moment( endDate, settings.format ),
                date_compare = moment( date, settings.format);

            return date_compare.isBetween( date1, date2, null, '[]' );

        }

        function dataInSet( data, name, date ){

            var obj_data = {};

            for( var i=0; i < data.length; i++){

                obj_data = data[i];

                if( 
                    name == obj_data.name &&
                    dateInRange( date, obj_data.startDate, obj_data.endDate )
                ){ 
                    
                    return obj_data;

                }

            } 

            return false;

        }

        function setData( targetObj, dataKeyValues, data ){

            var html          = '',
                dataKeyValues = settings.dataKeyValues,
                data          = settings.data,
                arr_dates     = [],
                name          = '',
                content       = '',
                hasEventClass = '',
                customClass   = '',
                classInSet    = false,
                obj_data      = {};

            targetObj.find('td.day_cell').each( function(index, value){

                arr_dates.push( $(this).attr('data-cellDate') );

            });

            

            targetObj.find('.rescalendar_data_rows').html( html );
        }

        function setDayCells( targetObj, refDate ){

            var format   = settings.format,
                f_inicio = moment( refDate, format ).subtract(settings.jumpSize, 'days'),
                f_fin    = moment( refDate, format ).add(settings.jumpSize, 'days'),
                today    = moment( ).startOf('day'),
                html            = '',
                f_aux           = '',
                f_aux_format    = '',
                dia             = '',
                dia_semana      = '',
                num_dia_semana  = 0,
                mes             = '',
                clase_today     = '',
                clase_middleDay = '',
                clase_disabled  = '',
                middleDay       = targetObj.find('input.refDate').val();
            var temp_mes="";

            for( var i = 0; i< (settings.calSize + 1) ; i++){

                clase_disabled = '';

                f_aux        = moment( f_inicio ).add(i, 'days');
                f_aux_format = f_aux.format( format );

                dia        = f_aux.format('DD');
               /* mes        = f_aux.locale( settings.locale ).format('MMM').replace('.','');*/
                mes        = f_aux.locale( settings.locale ).format("M")+"월";
                dia_semana = f_aux.locale( settings.locale ).format('ddd');
                num_dia_semana = f_aux.day();

                f_aux_format == today.format( format ) ? clase_today     = 'today'         : clase_today = '';
                f_aux_format == middleDay              ? clase_middleDay = 'middleDay' : clase_middleDay = '';

                if( 
                    settings.disabledDays.indexOf(f_aux_format) > -1 ||
                    settings.disabledWeekDays.indexOf( num_dia_semana ) > -1
                ){
                    
                    clase_disabled = 'disabledDay';
                }
                //수정한 코드. 예를 들어, "1월" 이면 이게 맨 처음 한번만 나오게. "2월"이 나오면 표시하도록.
                if(temp_mes==mes){
	                html += [
	                    '<td class="day_cell ' + clase_today + ' ' + clase_middleDay + ' ' + clase_disabled + '" data-cellDate="' + f_aux_format + '">',
	                    '<span class="mes" style="color: rgba(0, 0, 0, 0);">' + mes + '</span>',    
	                        '<span class="dia">' + dia + '</span>',
	                        '<span class="dia_semana">' + dia_semana + '</span>',
	                    '</td>'
	                ].join('');
                }
                else{
                	html += [
     	                    '<td class="day_cell ' + clase_today + ' ' + clase_middleDay + ' ' + clase_disabled + '" data-cellDate="' + f_aux_format + '">',
     	                    '<span class="mes">' + mes + '</span>',   
     	                        '<span class="dia">' + dia + '</span>',
     	                        '<span class="dia_semana">' + dia_semana + '</span>',
     	                    '</td>'
     	                ].join('');
                }
                temp_mes=mes;
              //수정한 코드 끝.. 사실 여기 말고 여기저기 조금씩 수정했지만.
            }

            targetObj.find('.rescalendar_day_cells').html( html );

            addTdClickEvent( targetObj );

            setData( targetObj )

            
        }

        function addTdClickEvent(targetObj){

            var day_cell = targetObj.find('td.day_cell');

            day_cell.on('click', function(e){
            
                var cellDate = e.currentTarget.attributes['data-cellDate'].value;

                targetObj.find('input.refDate').val( cellDate );
                $("#th-date").text(cellDate);
                $("#date").val(cellDate);

                setDayCells( targetObj, moment(cellDate, settings.format) );
                $('#form').submit();
            });

        }

        function change_day( targetObj, action, num_days ){

            var refDate = targetObj.find('input.refDate').val(),
                f_ref = '';

            if( action == 'subtract'){
                f_ref = moment( refDate, settings.format ).subtract(num_days, 'days');    
            }else{
                f_ref = moment( refDate, settings.format ).add(num_days, 'days');
            }
            
            targetObj.find('input.refDate').val( f_ref.format( settings.format ) );

            setDayCells( targetObj, f_ref );

        }

        // INITIALIZATION
        var settings = $.extend({
            id           : 'rescalendar',
            format       : 'YYYY-MM-DD',
            refDate      : moment().format( 'YYYY-MM-DD' ),
            jumpSize     : 7,
            calSize      : 15,
            locale       : 'en',
            disabledDays : [],
            disabledWeekDays: [],
            dataKeyField: 'name',
            dataKeyValues: [],
            data: {},

            lang: {
                'init_error' : 'Error when initializing',
                'no_data_error': 'No data found',
                'no_ref_date'  : 'No refDate found',
                'today'   : 'Today'
            },

            template_html: function( targetObj, settings ){
                
                var id      = targetObj.attr('id'),
                    refDate = settings.refDate ;

                return [

                    '<div class="rescalendar ' , id , '_wrapper">',

                        '<div class="rescalendar_controls" style="display:none">',

                            '<button class="move_to_last_month"> << </button>',
                            '<button class="move_to_yesterday"> < </button>',

                            '<input class="refDate" type="text" value="' + refDate + '" />',
                            
                            '<button class="move_to_tomorrow"> > </button>',
                            '<button class="move_to_next_month"> >> </button>',

                            '<br>',
                            '<button class="move_to_today"> ' + settings.lang.today + ' </button>',

                        '</div>',

                        '<table class="rescalendar_table">',
                            '<thead>',
                                '<tr class="rescalendar_day_cells"></tr>',
                            '</thead>',
                            '<tbody class="rescalendar_data_rows">',
                                
                            '</tbody>',
                        '</table>',
                        
                    '</div>',

                ].join('');

            }

        }, options);




        return this.each( function() {
            
            var targetObj = $(this);

            set_template( targetObj, settings);

            setDayCells( targetObj, settings.refDate );

            // Events
            var move_to_last_month = targetObj.find('.move_to_last_month'),
                move_to_yesterday  = targetObj.find('.move_to_yesterday'),
                move_to_tomorrow   = targetObj.find('.move_to_tomorrow'),
                move_to_next_month = targetObj.find('.move_to_next_month'),
                move_to_today      = targetObj.find('.move_to_today'),
                refDate            = targetObj.find('.refDate');

            move_to_last_month.on('click', function(e){
                
                change_day( targetObj, 'subtract', settings.jumpSize);

            });

            

            move_to_next_month.on('click', function(e){
                
                change_day( targetObj, 'add', settings.jumpSize);

            });

            refDate.on('blur', function(e){
                
                var refDate = targetObj.find('input.refDate').val();
                setDayCells( targetObj, refDate );

            });
            
            move_to_yesterday.on('click', function(e){
                
                change_day( targetObj, 'subtract', 1);
                var today=targetObj.find('input.refDate').val();
                $("#th-date").text(today);
                $("#date").val(today);
                setDayCells( targetObj, today );
                
                //submit 해야한다.
                $('#form').submit();

            });

            move_to_tomorrow.on('click', function(e){
                
                change_day( targetObj, 'add', 1);
                var today=targetObj.find('input.refDate').val();
                $("#th-date").text(today);
                $("#date").val(today);
                setDayCells( targetObj, today );
                
                //submit 해야한다.
                $('#form').submit();
            });
            
            move_to_today.on('click', function(e){
                
                var today = moment().startOf('day').format( settings.format );
                targetObj.find('input.refDate').val( today );
                $("#th-date").text(today);
                $("#date").val(today);
                setDayCells( targetObj, today );
                
                //submit 해야한다.
                $('#form').submit();

            });

            return this;

        });

    } // end rescalendar plugin


}(jQuery));